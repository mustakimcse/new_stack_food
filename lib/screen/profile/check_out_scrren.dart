import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

import '../../controller/cart_controller.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final cartController = Get.put(CartController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Image.asset("assets/icon/rectangle.png"),
        title: Text("Check Out"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 20,right: 20),
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Delivery",style: TextStyle(fontSize: 20),),
                    ),
                    const Padding(
                      padding:  EdgeInsets.all(8.0),
                      child: Divider(),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 10,),
                        Container(
                            decoration: const BoxDecoration(
                            color: Color(0xffb80808),
                            borderRadius: BorderRadius.all(Radius.circular(30))
                          ),
                            padding: const EdgeInsets.all(8),
                            child: Icon(Icons.location_on_sharp,color: Colors.white,),
                        ),
                        const Expanded(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Deliver to",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "1600 Pennsylvania ave NW, Washington DC 20500",
                                  style: TextStyle(color: Colors.grey),
                                  maxLines: 2, // Limit the text to 2 lines
                                  overflow: TextOverflow.ellipsis, // Handle overflow gracefully
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),

          Obx(() {
            return SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(12))
                  ), // Set your desired background color here
                  child: Column(
                    children: [
                      for (int index = 0; index < cartController.cartItems.length; index++)
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    child: Image.asset(
                                      cartController.cartItems.values.elementAt(index).image,
                                      width: 80,
                                      height: 80,
                                      fit: BoxFit.contain,
                                    ),
                                    borderRadius: BorderRadius.all(Radius.circular(15)),
                                  ),
                                  SizedBox(width: 30),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          cartController.cartItems.values.elementAt(index).name,
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(fontFamily: "RobotoB", fontSize: 16),
                                        ),
                                        Text(
                                          "with baked salmon",
                                          maxLines: 1,
                                          textAlign: TextAlign.start,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontFamily: "RobotoR",
                                            fontSize: 14,
                                            color: Color(0xff9896a1),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        Text(
                                          "\$ ${cartController.cartItems.values.elementAt(index).price}",
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.only(
                                          left: 10,
                                          right: 10,
                                          top: 5,
                                          bottom: 5,
                                        ),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(8)),
                                          border: Border.all(color: Color(0xffb80808)),
                                        ),
                                        child: Text(cartController
                                            .cartItems.values
                                            .elementAt(index)
                                            .quantity
                                            .toString()),
                                      ),
                                      SizedBox(height: 10),
                                      InkWell(
                                        onTap: () {
                                          cartController.deleteCartItem(
                                              cartController.cartItems.keys.elementAt(index));
                                        },
                                        child: Padding(
                                          padding: EdgeInsets.only(right: 10),
                                          child: Icon(
                                            Icons.delete,
                                            color: Color(0xffb80808),
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            // Add Divider only if it's not the last item
                            if (index != cartController.cartItems.length - 1)
                              Divider(
                                thickness: 1, // Adjust thickness as needed
                                color: Colors.grey[300], // Adjust color as needed
                                indent: 15, // Matches padding of the Row
                                endIndent: 15, // Matches padding of the Row
                              ),
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            );
          }),

          SliverToBoxAdapter(
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(12))
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Payment Method")
                    ],
                  )
                ],
              ),
            ),
          )



        ],
      ),
    );
  }
}
