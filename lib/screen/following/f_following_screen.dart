import 'package:flutter/material.dart';
import 'package:stack_food/screen/following/widget/following_widget.dart';

import '../../model/product_model.dart';
import '../../model/restaurants_model.dart';
import '../../widgets/following_widget.dart';
import '../../widgets/product_widget.dart';
import '../../widgets/restaurant_widget.dart';


class FFollowingScreen extends StatefulWidget {
  const FFollowingScreen({super.key});

  @override
  State<FFollowingScreen> createState() => _FFollowingScreenState();
}

class _FFollowingScreenState extends State<FFollowingScreen> {
  // Sample data for restaurants
  final List<ProductModel> product = [
    ProductModel(
      id: 1,
      name: "Gourmet Kitchen",
      subName: 'Hungry Puppets',
      foodImage: "assets/food/res10.png",
      restImage: "assets/shafe/shafe2.png",
      time: "10:00 AM",
      currentPrice: 150,
    ),
    ProductModel(
      id: 2,
      name: "Foodie's Delight",
      subName: "Hungry Puppets",
      foodImage: "assets/food/res11.png",
      restImage: "assets/shafe/shafe1.png",
      time: "12:00 PM",
      currentPrice: 120,

    ),

    ProductModel(
      id: 1,
      name: "Gourmet Kitchen",
      subName: 'Hungry Puppets',
      foodImage: "assets/food/res12.png",
      restImage: "assets/shafe/shafe2.png",
      time: "10:00 AM",
      currentPrice: 150,
    ),
    ProductModel(
      id: 2,
      name: "Foodie's Delight",
      subName: "Hungry Puppets",
      foodImage: "assets/food/res13.png",
      restImage: "assets/shafe/shafe1.png",
      time: "12:00 PM",
      currentPrice: 120,

    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: 300
            ),
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final restaurant = product[index];
                return FFollowingWidget(
                  id: restaurant.id,
                  name: restaurant.name,
                  manName: restaurant.subName,
                  foodImage: restaurant.foodImage,
                  RestImage: restaurant.restImage,
                  leftTime: restaurant.time,
                  currentPrice: restaurant.currentPrice,

                );
              },
              childCount: product.length, // Number of restaurants in the list
            ),
          ),
        ],
      ),
    );
  }
}
