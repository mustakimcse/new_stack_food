import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stack_food/util/consttants.dart';
import 'package:stack_food/util/responsiveSize.dart';



class ResProductWidget extends StatefulWidget {
  final int id;
  final String name;
  final String manName;
  final String foodImage;
  final String RestImage;
  final String leftTime;
  final int currentPrice;
  final VoidCallback onAddToCart;


  const ResProductWidget({
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
  State<ResProductWidget> createState() => _ResProductWidgetState();
}

class _ResProductWidgetState extends State<ResProductWidget> {

  @override
  Widget build(BuildContext context) {

    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            ClipRRect(
              borderRadius: BorderRadius.circular(15.0), // Adjust the radius as needed
              child: Image.asset(
                widget.foodImage,
                fit: BoxFit.contain,
                height: 100,// Ensures the image fits well inside the rounded corners
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.name,style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                  SizedBox(
                    height: responsiveSize(context, 0.009, 0).height,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/icon/bike.png"),
                          Text(' \$ 2.0',style: TextStyle(color: Color(0xff7d8391)),)
                        ],
                      ),

                      SizedBox(
                        height: responsiveSize(context, 0.01, 0.0).height, // Adjust height as needed
                        child: const VerticalDivider(
                          color: Colors.grey, // Customize color
                          thickness: 2, // Customize thickness
                          width: 20, // Adjust spacing around divider
                        ),
                      ),


                      Row(
                        children: [
                          Icon(Icons.star,color: Colors.orangeAccent,size: 18,),
                          Text('4.5 (30+)',style: TextStyle(color: Color(0xff7d8391)),)
                        ],
                      ),


                    ],
                  ),
                  SizedBox(
                    height: responsiveSize(context, 0.009, 0).height,
                  ),
                  Text(' \$${widget.currentPrice}',style: TextStyle(color: Color(0xff7d8391)),)
                ],
              ),
            ),

            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(35)),
                  color: mrBackground
                ),
              ),
            )



          ],
        ),
      ),
    );
  }
}

