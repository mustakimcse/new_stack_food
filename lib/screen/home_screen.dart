import 'package:flutter/material.dart';
import 'package:stack_food/screen/home_item/trades_screen.dart';

import 'home_item/following_screen.dart';
import 'home_item/restaurants_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 5,
          titleSpacing: 10,
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Image.asset("assets/icon/Tag-Location.png"),
                  const SizedBox(width: 5),
                  const Text(
                    "Deliver to",
                    style: TextStyle(color: Color(0xffb80808), fontSize: 14),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.only(left: 5, top: 8),
                child: Text(
                  "1600 Pennsylvania ave NW, Washington DC 20500",
                  style: TextStyle(color: Color(0xff515153), fontSize: 14),
                ),
              ),
            ],
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Image.asset("assets/icon/bell.png"),
            ),
          ],
          bottom: const TabBar(
            indicatorColor: Color(0xffb80808),
            labelColor: Color(0xffb80808),
            unselectedLabelColor: Color(0xff515153),
            tabs: [
              Tab(text: "Restaurants"),
              Tab(text: "Trades"),
              Tab(text: "Following"),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            RestaurantsScreen(),
            TradesScreen(),
            FollowingScreen()
          ],
        ),
      ),
    );
  }
}
