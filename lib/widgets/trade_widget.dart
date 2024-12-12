import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



class TradeWidget extends StatefulWidget {
  final int id;
  final String name;
  final String manName;
  final String foodImage;
  final String RestImage;
  final String time;
  final String leftTime;
  final int currentPrice;


  const TradeWidget({
    super.key,
    required this.id,
    required this.name,
    required this.manName,
    required this.foodImage,
    required this.RestImage,
    required this.time,
    required this.leftTime,
    required this.currentPrice,

  });

  @override
  State<TradeWidget> createState() => _TradeWidgetState();
}

class _TradeWidgetState extends State<TradeWidget> {

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
                    fit: BoxFit.cover, // Ensures the image fits well inside the rounded corners
                  ),
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
                        Image.asset("assets/icon/bargar.png"),
                        Text(" 20 % off")
                      ],
                    ),
                  ),
                ),
      
                Positioned(
                  right: 10,
                  top: 20,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Image.asset("assets/icon/chats.png"),
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.only(left: 15,right: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(widget.RestImage),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.name,style: TextStyle(fontSize: 16),),
      
                      RichText(
                          text: TextSpan(
                            text: '${widget.manName} | 3/8',
                            style: TextStyle(color: Color(0xff5b5b5d)),
                            children:[
                              TextSpan(
                                text: 'Available',
                                style: TextStyle(color: Color(0xff9c1415))
                              )
                            ]
                          )
                      ),
      
                    ],
                  ),
                  Spacer(),
                  Container(
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
                  )
                ],
              ),
            ),
      
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
      
      
          ],
        ),
      ),
    );
  }
}

