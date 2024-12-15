import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:stack_food/screen/profile/payment_list_screen.dart';

import '../../controller/cart_controller.dart';
import '../../model/payment_method_list_model.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key});

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  final cartController = Get.put(CartController());
  PaymentMethodListModel? selectedPaymentMethod;
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
                                        const Text(
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
                                            Icons.edit,
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
          //payment method
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
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
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/icon/method.png"),
                        ),
                        Text("Payment Method"),

                        Spacer(),

                        if (selectedPaymentMethod != null)
                          Row(
                            children: [
                              Image.asset(
                                selectedPaymentMethod!.icon,
                                height: 20,
                              ),
                              const SizedBox(width: 5),
                              Text(selectedPaymentMethod!.name),
                            ],
                          ),

                        IconButton(
                          onPressed: () async {
                            // Navigate to PaymentListScreen and handle the selected payment method
                            final result = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentListScreen(
                                  onSelectPaymentMethod: (method) {
                                    setState(() {
                                      selectedPaymentMethod = method;
                                    });
                                  },
                                ),
                              ),
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_forward_ios,
                            size: 17,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/icon/discount.png"),
                        ),
                        Text("Get discount"),
                        Spacer(),

                        IconButton(
                            onPressed: (){},
                            icon: Icon(Icons.arrow_forward_ios,size: 17,)
                        )
                      ],
                    ),


                  ],
                ),
              ),
            ),
          ),

          //total calculation
          SliverToBoxAdapter(
            child: Obx((){
              if(cartController.cartItems.isNotEmpty){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [



                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Subtotal",style: TextStyle(fontSize: 15),),
                              RichText(
                                  text: TextSpan(
                                      text: '\$ ${cartController.totalPrice} ',
                                      style: TextStyle(fontSize: 15,color: Colors.black),
                                      children: [
                                        TextSpan(
                                            text: "USD",
                                            style: TextStyle(fontSize:14,color: Color(0xff9896a1,),)
                                        )
                                      ]
                                  )
                              )

                            ],
                          ),
                        ),




                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16,bottom: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Deoivery Fee",style: TextStyle(fontSize: 15),),
                              RichText(
                                  text: TextSpan(
                                      text: '\$ 3.50 ',
                                      style: TextStyle(fontSize: 15,color: Colors.black),
                                      children: [
                                        TextSpan(
                                            text: "USD",
                                            style: TextStyle(fontSize:14,color: Color(0xff9896a1,),)
                                        )
                                      ]
                                  )
                              )

                            ],
                          ),
                        ),


                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("Total",style: TextStyle(fontSize: 15),),
                              RichText(
                                  text: TextSpan(
                                      text: '\$ 59.50 ',
                                      style: TextStyle(fontSize: 15,color: Colors.black),
                                      children: [
                                        TextSpan(
                                            text: "USD",
                                            style: TextStyle(fontSize:14,color: Color(0xff9896a1,),)
                                        )
                                      ]
                                  )
                              )

                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                );
              }else{
                return SizedBox.shrink();
              }

            }),
          ),

          SliverToBoxAdapter(child: SizedBox(height: 30,)),

          SliverToBoxAdapter(
            child: Center(
              child: ElevatedButton(
                onPressed: (){
                  Get.to(CheckOutScreen());
                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 100),
                    backgroundColor: const Color(0xffb80808)
                ),
                child:  Text("Place Order - \$ ${cartController.totalPrice}",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ),
          )



        ],
      ),
    );
  }
}
