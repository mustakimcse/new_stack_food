import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stack_food/controller/cart_controller.dart';
import 'package:stack_food/screen/food_screen.dart';
import 'package:stack_food/screen/restaurant/widget/res_product_widget.dart';

import '../../model/product_model.dart';
import '../../model/restaurants_model.dart';
import '../../widgets/product_widget.dart';
import '../../widgets/restaurant_widget.dart';


class ResSnacksScreen extends StatefulWidget {
  const ResSnacksScreen({super.key});

  @override
  State<ResSnacksScreen> createState() => _ResSnacksScreenState();
}

class _ResSnacksScreenState extends State<ResSnacksScreen> {

  final cardController=Get.put(CartController());
  // Sample data for restaurants
  final List<ProductModel> product = [
    ProductModel(
      id: 1,
      name: "Gourmet Kitchen",
      subName: 'Hungry Puppets',
      foodImage: "assets/food/res7.png",
      restImage: "assets/shafe/shafe2.png",
      time: "10:00 AM",
      currentPrice: 150,
    ),
    ProductModel(
      id: 2,
      name: "Foodie's Delight",
      subName: "Hungry Puppets",
      foodImage: "assets/food/res8.png",
      restImage: "assets/shafe/shafe1.png",
      time: "12:00 PM",
      currentPrice: 120,

    ),

    ProductModel(
      id: 3,
      name: "Gourmet Kitchen",
      subName: 'Hungry Puppets',
      foodImage: "assets/food/res9.png",
      restImage: "assets/shafe/shafe2.png",
      time: "10:00 AM",
      currentPrice: 150,
    ),
    ProductModel(
      id: 4,
      name: "Foodie's Delight",
      subName: "Hungry Puppets",
      foodImage: "assets/food/res10.png",
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

          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final restaurant = product[index];
                return InkWell(
                  onTap: (){
                    Get.to(FoodScreen());
                  },
                  child: ResProductWidget(
                    id: restaurant.id,
                    name: restaurant.name,
                    manName: restaurant.subName,
                    foodImage: restaurant.foodImage,
                    RestImage: restaurant.restImage,
                    leftTime: restaurant.time,
                    onAddToCart: (){
                      cardController.addToCart(
                          restaurant.id,
                          restaurant.name,
                          restaurant.currentPrice.toDouble(),
                          restaurant.foodImage
                      );
                    },

                    currentPrice: restaurant.currentPrice,

                  ),
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
