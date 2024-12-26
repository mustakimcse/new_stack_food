import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stack_food/screen/restaurant/res_home_screen.dart';

import '../../controller/all_res_controller.dart';
import '../../model/restaurants_model.dart';
import '../../widgets/restaurant_widget.dart';


class RestaurantsScreen extends StatefulWidget {
  const RestaurantsScreen({super.key});

  @override
  State<RestaurantsScreen> createState() => _RestaurantsScreenState();
}

class _RestaurantsScreenState extends State<RestaurantsScreen> {

  final AllProductController controller = Get.put(AllProductController());

  // Sample data for restaurants
  final List<Restaurant> restaurants = [
    Restaurant(
      id: 1,
      name: "Gourmet Kitchen",
      foodImage: "assets/food/res1.png",
      restImage: "assets/shafe/shafe2.png",
      time: "10:00 AM",
      leftTime: "2 hours",
      currentPrice: 150,
      foodList: [
        Food(name: "Pizza", price: 8.99, imageUrl: "assets/food/res1.png"),
        Food(name: "Burger", price: 5.49, imageUrl: "assets/food/res2.png"),
      ],
    ),
    Restaurant(
      id: 2,
      name: "Foodie's Delight",
      foodImage: "assets/food/res3.png",
      restImage: "assets/shafe/shafe1.png",
      time: "12:00 PM",
      leftTime: "1 hour",
      currentPrice: 120,
      foodList: [
        Food(name: "Salad", price: 4.99, imageUrl: "assets/shafe/shafe1.png"),
        Food(name: "Soup", price: 3.49, imageUrl: "assets/shafe/shafe2.png"),
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: CustomScrollView(
        slivers: [



          Obx((){
            if (controller.isLoading.value) {
              return const SliverToBoxAdapter(child:  Center(child: CircularProgressIndicator()));
            }

            if (controller.restaurantsList.isEmpty) {
              return const SliverToBoxAdapter(child: Center(child: Text("No Restaurants Available")));
            }
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  final restaurant = controller.restaurantsList[index];
                  return InkWell(
                    onTap: () {
                      Get.to(() => ResHomeScreen());
                    },
                    child: RestaurantWidget(
                      id: restaurant.id,
                      name: restaurant.name,
                      foodImage: restaurant.coverPhoto??'',
                      RestImage: restaurant.logo ?? '',
                      time: "10:00 AM", // Adjust if API provides timings
                      leftTime: "2 hours", // Adjust if API provides timings
                      currentPrice: restaurant.minimumOrder,
                      foodList: restaurant.foods, // Populate if API provides food list
                    ),
                  );
                },
                childCount: controller.restaurantsList.length,
              ),
            );
          }),
          // SliverList(
          //   delegate: SliverChildBuilderDelegate(
          //         (context, index) {
          //       final restaurant = restaurants[index];
          //       return InkWell(
          //         onTap: (){
          //           Get.to(ResHomeScreen());
          //         },
          //         child: RestaurantWidget(
          //           id: restaurant.id,
          //           name: restaurant.name,
          //           foodImage: restaurant.foodImage,
          //           RestImage: restaurant.restImage,
          //           time: restaurant.time,
          //           leftTime: restaurant.leftTime,
          //           currentPrice: restaurant.currentPrice,
          //           foodList: restaurant.foodList.map((food) => food.name).toList(),
          //         ),
          //       );
          //     },
          //     childCount: restaurants.length, // Number of restaurants in the list
          //   ),
          // ),
        ],
      ),
    );
  }
}
