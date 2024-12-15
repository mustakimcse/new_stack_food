import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stack_food/screen/profile/check_out_scrren.dart';

import '../../controller/cart_controller.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

  final cartController = Get.put(CartController());
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Cart"),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          Obx((){
            return SliverList.builder(
              itemCount: cartController.cartItems.length,
              itemBuilder: (context, index) {
                final cartItemKey =
                cartController.cartItems.keys.elementAt(index);
                final cartItem = cartController.cartItems[cartItemKey]!;
                return Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        child: Image.asset(cartItem.image, width: 80, height: 80, fit: BoxFit.contain),
                        borderRadius: BorderRadius.all(Radius.circular(15)),
                      ),
                      SizedBox(width: 30,),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              cartItem.name,
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
                            // Quantity bar
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text("\$ ${cartItem.price}"),

                                Row(
                                  children: [
                                    // Decrease Button (-)
                                    InkWell(
                                      onTap:(){
                                        cartController.decrementQuantity(cartItemKey);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: BoxDecoration(
                                            borderRadius: const BorderRadius.all(Radius.circular(30)),
                                            border: Border.all(color: Color(0xffb80808))
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.remove,
                                            color: Colors.black,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),

                                    // Quantity Text
                                    Obx((){
                                      return Container(
                                        width: 40,
                                        height: 30,
                                        alignment: Alignment.center,

                                        child:  Text(
                                          "${cartItem.quantity}",
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'RobotoR',
                                          ),
                                        ),
                                      );
                                    }),

                                    // Increase Button (+)
                                    InkWell(
                                      onTap:(){
                                        cartController.incrementQuantity(cartItemKey);
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 40,
                                        decoration: const BoxDecoration(
                                          color: Color(0xffb80808),
                                          borderRadius: BorderRadius.all(Radius.circular(30)),
                                        ),
                                        child: const Center(
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),



                      InkWell(
                        onTap:(){
                          cartController.deleteCartItem(cartItemKey);
                        },
                        child:  Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(Icons.close,color: Color(0xffb80808),size: 18,),
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          }),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),

          SliverToBoxAdapter(
            child: Obx((){
              if(cartController.cartItems.isNotEmpty){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tips",style: TextStyle(fontSize: 18),),
                          RichText(
                              text: TextSpan(
                                  text: '\$ 5.50 ',
                                  style: TextStyle(fontSize: 18,color: Colors.black),
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
                      child: Divider(),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Subtotal",style: TextStyle(fontSize: 18),),
                          RichText(
                              text: TextSpan(
                                  text: '\$ ${cartController.totalPrice} ',
                                  style: TextStyle(fontSize: 18,color: Colors.black),
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
                      child: Divider(),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Tax and Fees",style: TextStyle(fontSize: 18),),
                          RichText(
                              text: TextSpan(
                                  text: '\$ 5.50 ',
                                  style: TextStyle(fontSize: 18,color: Colors.black),
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
                      child: Divider(),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Deoivery",style: TextStyle(fontSize: 18),),
                          RichText(
                              text: TextSpan(
                                  text: '\$ 3.50 ',
                                  style: TextStyle(fontSize: 18,color: Colors.black),
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
                      child: Divider(),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 16,right: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total",style: TextStyle(fontSize: 18),),
                          RichText(
                              text: TextSpan(
                                  text: '\$ 59.50 ',
                                  style: TextStyle(fontSize: 18,color: Colors.black),
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
                      child: Divider(),
                    ),
                  ],
                );
              }else{
                return SizedBox.shrink();
              }

            }),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),
          if(cartController.cartItems.isNotEmpty)
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
                child: const Text("Check Out",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 100,
            ),
          )
        ],
      ),
    );
  }
}
