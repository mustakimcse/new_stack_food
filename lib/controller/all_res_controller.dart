import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../model/restaurants_model.dart';
import '../model/restaurants/all_resturants_model.dart';

class AllProductController extends GetxController {
  var isLoading = true.obs;
  var restaurantsList = <Restaurants>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRestaurants();
  }

  Future<void> fetchRestaurants() async {
    const url = "https://stackfood-admin.6amtech.com/api/v1/restaurants/get-restaurants/all";

    try {
      final headers = {
        'zoneId': [1].toString(), // Add your custom header here
      };
      isLoading(true);
      final response = await http.get(Uri.parse(url),headers: headers);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final allRestaurantModel = AllRestaurantModel.fromJson(data);
        restaurantsList.value = allRestaurantModel.restaurants;
      } else {
        Get.snackbar("Error", "Failed to fetch restaurants");
      }
    } catch (e) {
      Get.snackbar("Error", e.toString());
    } finally {
      isLoading(false);
    }
  }
}
