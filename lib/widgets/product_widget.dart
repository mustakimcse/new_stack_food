import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ProductWidget extends StatefulWidget {
  final int id;
  final String name;
  final String manName;
  final String foodImage;
  final String RestImage;
  final String leftTime;
  final int currentPrice;
  final VoidCallback onAddToCart;


  const ProductWidget({
    super.key,
    required this.id,
    required this.name,
    required this.manName,
    required this.foodImage,
    required this.RestImage,
    required this.leftTime,
    required this.currentPrice,
    required this.onAddToCart

  });

  @override
  State<ProductWidget> createState() => _ProductWidgetState();
}

class _ProductWidgetState extends State<ProductWidget> {

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
                  child: Image.asset(
                    widget.foodImage,
                    fit: BoxFit.contain,
                    height: 200,// Ensures the image fits well inside the rounded corners
                  ),
                ),
      
                Positioned(
                  left: 10,
                  top: 20,
                  child: Container(
                    padding: EdgeInsets.only(top: 5,left: 8,right: 8,bottom: 5),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Row(
                      children: [
                        RichText(
                            text: const TextSpan(
                                text: '\$ ',
                                style: TextStyle(color: Color(0xff9c1415)),
                                children: [
                                  TextSpan(
                                      text: '20 ',
                                      style: TextStyle(color: Colors.black)
                                  )
                                ]
                            )
                        )
      
                      ],
                    ),
                  ),
                ),
      
                Positioned(
                  bottom: -20,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
      
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    const Row(
                                      children: [
                                        Text("4.5 ",style: TextStyle(fontSize: 8),),
                                        Icon(Icons.star,color: Colors.orangeAccent,size: 8,),
                                        Text("25 +",style: TextStyle(color: Color(0xff9896a0,),fontSize: 8),)
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text("Distance ",style: TextStyle(fontSize: 8),),
                                        Text("${widget.leftTime} min",style: TextStyle(color: Color(0xff9896a0,),fontSize: 8),)
                                      ],
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const Divider(),
                          InkWell(
                            onTap: widget.onAddToCart,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset("assets/icon/shopping-bag1.png"),
                                SizedBox(width: 5,),
                                const Text("Add to cart")
                              ],
                            ),
                          ),
      
      
      
      
                        ],
                      ),
                    ),
                  ),
                )
      
      
              ],
            ),
      
            SizedBox(height: 20,),
      
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/man/per2.png",height: 30,),
                SizedBox(width: 5,),
                Column(
                  children: [
                    Text("White Pizza"),
                    Text("James Mark",style: TextStyle(fontSize: 12),),
                  ],
                )
              ],
            )
      
      
          ],
        ),
      ),
    );
  }
}

