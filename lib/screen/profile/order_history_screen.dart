import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stack_food/screen/profile/order_track_screen.dart';
import 'package:stack_food/widgets/order_history_list_widget.dart';

import '../../model/profile/order_history_model.dart';

class OrderHistoryScreen extends StatefulWidget {
  const OrderHistoryScreen({super.key});

  @override
  State<OrderHistoryScreen> createState() => _OrderHistoryScreenState();
}

class _OrderHistoryScreenState extends State<OrderHistoryScreen> {

  List<OrderModel> orders = [
    OrderModel(
      orderId: "2692",
      date: "Active",
      status: "Active",
      items: [
        OrderItem(image: "assets/food/res19.png",title: "FoodTitle", quantity: 1),
        OrderItem(image: "assets/food/res19.png",title: "FoodTitle", quantity: 1),
      ],
      total: 23.20,
    ),
    OrderModel(
      orderId: "2679",
      date: "2 days ago",
      status: "Delivered",
      items: [
        OrderItem(image: "assets/food/res19.png",title: "FoodTitle", quantity: 1),
        OrderItem(image: "assets/food/res19.png",title: "FoodTitle", quantity: 1),
      ],
      total: 23.20,
    ),
    OrderModel(
      orderId: "2621",
      date: "1 week ago",
      status: "Delivered",
      items: [
        OrderItem(
          image: "assets/food/res19.png",
            title: "FoodTitle",
            quantity: 1
        ),
        OrderItem(image: "assets/food/res19.png",title: "FoodTitle", quantity: 1),
      ],
      total: 23.20,
    ),
  ];

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
        title: Text("Order History"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
            itemCount: orders.length,
              itemBuilder: (context,index){
                final data=orders[index];
                return InkWell(
                  onTap: (){
                    Get.to(OrderTrackingScreen());
                  },
                  child: OrderHistoryWidget(
                      orderId: data.orderId,
                      date: data.date,
                      status: data.status,
                      statusColor: 1,
                      items: data.items,
                      total: data.total
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}
