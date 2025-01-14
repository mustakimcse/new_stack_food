import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

class OrderTrackingScreen extends StatefulWidget {
  const OrderTrackingScreen({super.key});

  @override
  State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
}

class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();

  // Initial positions
  static const LatLng _restaurantPosition = LatLng(23.8103, 90.4127486);
  LatLng _driverPosition = const LatLng(23.7930, 90.4043); // Default position
  Timer? _locationUpdateTimer;

  Set<Polyline> _polylines = {};

  @override
  void initState() {
    super.initState();
    // Start fetching location periodically
    _startLocationUpdates();
    _drawRoute();
  }

  @override
  void dispose() {
    // Cancel timer when the widget is disposed
    _locationUpdateTimer?.cancel();
    super.dispose();
  }

  void _startLocationUpdates() {
    _locationUpdateTimer = Timer.periodic(const Duration(seconds: 5), (timer) {
      _fetchDriverLocation();
    });
  }

  Future<void> _fetchDriverLocation() async {
    try {
      // Replace with your API endpoint
      const String apiUrl = 'https://example.com/api/driver/location';

      final response = await http.get(Uri.parse(apiUrl));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Extract latitude and longitude from API response
        final double latitude = data['latitude'];
        final double longitude = data['longitude'];

        setState(() {
          _driverPosition = LatLng(latitude, longitude);
        });

        // Update route on location change
        _drawRoute();

        // Move camera to the updated location
        final GoogleMapController controller = await _controller.future;
        controller.animateCamera(CameraUpdate.newLatLng(_driverPosition));
      } else {
        debugPrint('Failed to fetch location: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Error fetching location: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(35)),

            ),
            child: Image.asset("assets/icon/rectangle.png")
        ),
        title: const Text("Track Order"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Google Map
          GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: const CameraPosition(
              target: _restaurantPosition,
              zoom: 14.0,
            ),
            markers: {
              const Marker(
                markerId: MarkerId('restaurant'),
                position: _restaurantPosition,
                infoWindow: InfoWindow(title: 'Kimukatsu Restaurant'),
              ),
              Marker(
                markerId: const MarkerId('driver'),
                position: _driverPosition,
                infoWindow: const InfoWindow(title: 'Driver Location'),
              ),
            },
            polylines: _polylines,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          // UI Overlay (Driver Info),
          Positioned(
            top: 50,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Kimukatsu Restaurant',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text('4 Items'),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 100,
            left: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
              ),
              child: const Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage("assets/man/per2.png"), // Driver image
                    radius: 30,
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('John Doe', style: TextStyle(fontWeight: FontWeight.bold)),
                        Text('Live Tracking Active'),
                      ],
                    ),
                  ),
                  Icon(Icons.directions_car, color: Colors.blue),
                  Icon(Icons.call, color: Colors.blue),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _drawRoute() async {
    try {
      // Use Google Directions API to get the route
      const String baseUrl = 'https://maps.googleapis.com/maps/api/directions/json';
      const String apiKey = 'AIzaSyDUDEfxlI5sfTaeN-wOKphkht1ma2kgalY'; // Replace with your API key

      final String url =
          '$baseUrl?origin=${_restaurantPosition.latitude},${_restaurantPosition.longitude}'
          '&destination=${_driverPosition.latitude},${_driverPosition.longitude}'
          '&key=$apiKey';

      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Decode polyline points from the API response
        final points = _decodePolyline(data['routes'][0]['overview_polyline']['points']);
        setState(() {
          _polylines = {
            Polyline(
              polylineId: PolylineId('route'),
              points: points,
              color: Colors.red,
              width: 5,
            ),
          };
        });
      } else {
        debugPrint('Failed to fetch route: ${response.statusCode}');
      }
    } catch (error) {
      debugPrint('Error fetching route: $error');
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polylineCoordinates = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int shift = 0, result = 0;
      int b;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
      lng += dlng;

      polylineCoordinates.add(LatLng(lat / 1E5, lng / 1E5));
    }
    return polylineCoordinates;
  }

}
