import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stack_food/screen/profile/check_out_scrren.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {

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
          SliverList.builder(
            itemCount: 5,
            itemBuilder: (context, index) {

              return Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                        child: Image.asset("assets/food/res9.png", width: 80, height: 80, fit: BoxFit.contain),
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    SizedBox(width: 30,),

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Read n hot pizza",
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
                              Text("\$ 9.50"),
                              
                              Row(
                                children: [
                                  // Decrease Button (-)
                                  Container(
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
                      
                                  // Quantity Text
                                  Container(
                                    width: 40,
                                    height: 30,
                                    alignment: Alignment.center,
                      
                                    child: const Text(
                                      "05",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'RobotoR',
                                      ),
                                    ),
                                  ),
                      
                                  // Increase Button (+)
                                  Container(
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
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),



                    const Padding(
                      padding: EdgeInsets.only(right: 10),
                      child: Icon(Icons.close,color: Color(0xffb80808),size: 18,),
                    )
                  ],
                ),
              );
            },
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),

          SliverToBoxAdapter(
            child: Column(
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
                              text: '\$ 50.50 ',
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
            ),
          ),

          const SliverToBoxAdapter(
            child: SizedBox(
              height: 10,
            ),
          ),

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
