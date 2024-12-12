import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stack_food/screen/following/f_home_screen.dart';

import '../../model/following_model.dart';
import '../../model/restaurants_model.dart';
import '../../model/trades_model.dart';
import '../../widgets/following_widget.dart';
import '../../widgets/restaurant_widget.dart';
import '../../widgets/trade_widget.dart';


class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => _FollowingScreenState();
}

class _FollowingScreenState extends State<FollowingScreen> {
  // Sample data for restaurants
  final List<FollowingModel> following = [
    FollowingModel(
      id: 1,
      name: "Gourmet Kitchen",
      manName: 'Md.Mustakim',
      foodImage: "assets/food/res4.png",
      restImage: "assets/shafe/shafe1.png",
      time: "10:00 AM",
      leftTime: "2 hours",
      currentPrice: 150,

    ),
    FollowingModel(
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
                final restaurant = following[index];
                return InkWell(
                  onTap: (){
                    Get.to(FHomeScreen());
                  },
                  child: FollowingWidget(
                    id: restaurant.id,
                    name: restaurant.name,
                    manName: restaurant.manName,
                    foodImage: restaurant.foodImage,
                    RestImage: restaurant.restImage,
                    time: restaurant.time,
                    leftTime: restaurant.leftTime,
                    currentPrice: restaurant.currentPrice,

                  ),
                );
              },
              childCount: following.length, // Number of restaurants in the list
            ),
          ),
        ],
      ),
    );
  }
}
