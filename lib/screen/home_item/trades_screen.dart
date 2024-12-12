import 'package:flutter/material.dart';

import '../../model/restaurants_model.dart';
import '../../model/trades_model.dart';
import '../../widgets/restaurant_widget.dart';
import '../../widgets/trade_widget.dart';


class TradesScreen extends StatefulWidget {
  const TradesScreen({super.key});

  @override
  State<TradesScreen> createState() => _TradesScreenState();
}

class _TradesScreenState extends State<TradesScreen> {
  // Sample data for restaurants
  final List<TradesModel> trades = [
    TradesModel(
      id: 1,
      name: "Gourmet Kitchen",
      manName: 'Md.Mustakim',
      foodImage: "assets/food/res4.png",
      restImage: "assets/man/per1.png",
      time: "10:00 AM",
      leftTime: "2 hours",
      currentPrice: 150,

    ),
    TradesModel(
      id: 2,
      name: "Foodie's Delight",
      manName: "Rajiya",
      foodImage: "assets/food/res5.png",
      restImage: "assets/man/per2.png",
      time: "12:00 PM",
      leftTime: "1 hour",
      currentPrice: 120,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final restaurant = trades[index];
                return TradeWidget(
                  id: restaurant.id,
                  name: restaurant.name,
                  manName: restaurant.manName,
                  foodImage: restaurant.foodImage,
                  RestImage: restaurant.restImage,
                  time: restaurant.time,
                  leftTime: restaurant.leftTime,
                  currentPrice: restaurant.currentPrice,

                );
              },
              childCount: trades.length, // Number of restaurants in the list
            ),
          ),
        ],
      ),
    );
  }
}
