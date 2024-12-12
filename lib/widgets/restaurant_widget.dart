import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class RestaurantWidget extends StatefulWidget {
  final int id;
  final String name;
  final String foodImage;
  final String RestImage;
  final String time;
  final String leftTime;
  final int currentPrice;
  final List<String> foodList;

  const RestaurantWidget({
    super.key,
    required this.id,
    required this.name,
    required this.foodImage,
    required this.RestImage,
    required this.time,
    required this.leftTime,
    required this.currentPrice,
    required this.foodList

  });

  @override
  State<RestaurantWidget> createState() => _RestaurantWidgetState();
}

class _RestaurantWidgetState extends State<RestaurantWidget> {

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
                Image.asset(widget.foodImage),
                Positioned(
                    bottom: -180,
                    left: 0,
                    right: 0,
                    child: Image.asset(widget.RestImage)
                ),
                Positioned(
                  left: 10,
                  top: 20,
                  child: Container(
                    padding: EdgeInsets.only(top: 5,left: 8,right: 8,bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Row(
                      children: [
                        Image.asset("assets/icon/discount.png"),
                        Text(" 20 % off")
                      ],
                    ),
                  ),
                ),

                Positioned(
                  right: 10,
                  top: 20,
                  child: Container(
                    padding: EdgeInsets.only(top: 5,left: 8,right: 8,bottom: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Row(
                      children: [
                        Text("4.5 "),
                        Icon(Icons.star,color: Colors.orangeAccent,size: 18,),
                        Text("25 +",style: TextStyle(color: Color(0xff9896a0)),)
                      ],
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 60),

            Text(widget.name,style: TextStyle(fontSize: 16),),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Image.asset("assets/icon/bike.png"),
                    Text(' \$${widget.currentPrice}',style: TextStyle(color: Color(0xff7d8391)),)
                  ],
                ),

                Row(
                  children: [
                    Image.asset("assets/icon/clock.png"),
                    Text(' 10-20 mins',style: TextStyle(color: Color(0xff7d8391)),)
                  ],
                ),


                Row(
                  children: [
                    Image.asset("assets/icon/send.png"),
                    Text(' ${widget.leftTime} mi',style: const TextStyle(color: Color(0xff7d8391)),)
                  ],
                ),
              ],
            ),

            const SizedBox(height: 10),
            SizedBox(
              height: 40, // Adjust the height based on your design
              child: Center( // Centers the entire ListView horizontally
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: widget.foodList.length,
                  shrinkWrap: true, // Ensures it wraps the content
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Chip(
                        label: Text(widget.foodList[index]),
                        backgroundColor: Color(0xfff6f6f5),
                        side: BorderSide(color: Colors.white),
                      ),
                    );
                  },
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
