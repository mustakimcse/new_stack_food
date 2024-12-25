import 'package:flutter/material.dart';
import 'package:stack_food/screen/following/f_following_screen.dart';
import 'package:stack_food/screen/following/f_reviews_screen.dart';
import 'package:stack_food/screen/following/f_trades_screen.dart';
import 'package:stack_food/screen/restaurant/res_all_product_screen.dart';
import 'package:stack_food/screen/restaurant/res_pasta_screen.dart';
import 'package:stack_food/screen/restaurant/res_pizza_screen.dart';
import 'package:stack_food/screen/restaurant/res_snacks_screen.dart';

import '../following/f_restaurants_screen.dart';




class ResHomeScreen extends StatefulWidget {
  const ResHomeScreen({super.key});

  @override
  State<ResHomeScreen> createState() => _ResHomeScreenState();
}

class _ResHomeScreenState extends State<ResHomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return [
            SliverAppBar(
              pinned: true,
              expandedHeight: 500.0,
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      top: 0, // Move image to the top of the AppBar
                      left: 0,
                      right: 0,
                      child: Image.asset(
                        "assets/food/res4.png",
                        fit: BoxFit.cover, // Ensure it covers the space nicely
                        height: 300.0, // Match the AppBar's expandedHeight
                      ),
                    ),
                    Positioned(
                      top: 40,
                      left: 20,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset("assets/icon/rectangle.png"),
                      ),
                    ),
                    Positioned(
                      top: 40,
                      right: 20,
                      child: Row(
                        children: [

                          InkWell(
                            onTap: (){
                              showProfile();
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Image.asset("assets/icon/share.png"),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      top: 200,
                      left: 0,
                      right: 0,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF5F5F5),
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image.asset("assets/shafe/shafe1.png"),
                                    const SizedBox(width: 10),
                                    const Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Kimukatsu Restaurant",
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Text(
                                          "@gmail.com",
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xffd5d5d5),
                                          ),
                                        ),
                                      ],
                                    ),

                                  ],
                                ),
                              ),
                              const SizedBox(height: 20),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Column(
                                    children: const [
                                      Text(
                                        "290",
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      Text(
                                        "Orders",
                                        style: TextStyle(
                                            fontSize: 14, color: Color(0xff797979)),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "2.1",
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      Text(
                                        "Followers",
                                        style: TextStyle(
                                            fontSize: 14, color: Color(0xff797979)),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: const [
                                      Text(
                                        "240",
                                        style: TextStyle(fontSize: 19),
                                      ),
                                      Text(
                                        "Referrals",
                                        style: TextStyle(
                                            fontSize: 14, color: Color(0xff797979)),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              const Divider(),
                              const Text(
                                "Lorem ipsum dolor sit amet, "
                                    "consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et"
                                    " dolore magna aliqua.",
                              ),
                              const SizedBox(height: 20),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset("assets/icon/Tag-Location.png"),
                                      Text('3.8 mi',style: TextStyle(color: Color(0xff7d8391)),)
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Image.asset("assets/icon/clock.png"),
                                      Text(' 10-20 mins',style: TextStyle(color: Color(0xff7d8391)),)
                                    ],
                                  ),


                                  const Row(
                                    children: [
                                      Icon(Icons.star,color: Colors.orangeAccent,size: 18,),
                                      Text('4.5',style: TextStyle(color: Color(0xff7d8391)),)
                                    ],
                                  ),
                                ],
                              ),

                              const SizedBox(height: 10),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/icon/user-plus.png"),
                                        const SizedBox(width: 10),
                                        const Text("Follow"),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: Colors.grey[100],
                                      borderRadius: const BorderRadius.all(
                                        Radius.circular(15),
                                      ),
                                    ),
                                    padding: const EdgeInsets.all(8),
                                    child: Row(
                                      children: [
                                        Image.asset("assets/icon/chats.png"),
                                        const SizedBox(width: 10),
                                        const Text("Chat"),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            ),

            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverAppBarDelegate(
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  indicatorColor: Colors.blue,
                  tabs: const [
                    Tab(text: "All"),
                    Tab(text: "Pasta"),
                    Tab(text: "Pizza"),
                    Tab(text: "Snacks"),
                  ],
                ),
              ),
            ),
          ];
        },
        body: TabBarView(
          controller: _tabController,
          children: const [
            ResAllProductScreen(),
            ResPastaScreen(),
            ResPizzaScreen(),
            ResSnacksScreen(),
          ],
        ),
      ),
    );
  }

  void showProfile() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Ensures the modal can take full width if needed
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20), // Optional: Rounded corners for the top of the dialog
        ),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setModalState) {
            return Container(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min, // Adjust height based on content
                children: [
                  const Text(
                    "Share Profile",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  Center(
                    child: Container(
                      width: 120,
                      height: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(16),
                        gradient: const LinearGradient(
                          colors: [Colors.red, Colors.orange, Colors.yellow],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16), // Match border radius
                        child: Image.asset(
                          "assets/shafe/shafe1.png",
                          fit: BoxFit.cover, // Ensures the image fits the container
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text("Kimukatsu Restaurant"),
                  Text("@gmail.com"),

                  Image.asset("assets/yeloooo.png",height: 40,),

                  Text("Weeklyeat",style: TextStyle(fontSize: 22),),
                  Text("Decentralized Homemade Meals \n Cook & Trade with your neighbors"),

                  const SizedBox(height: 20),
                  Center(
                    child: ElevatedButton(
                      onPressed: (){

                      },
                      style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 100),
                          backgroundColor: const Color(0xffb80808)
                      ),
                      child: const Text("Share",style: TextStyle(color: Colors.white,fontSize: 20),),
                    ),
                  ),

                  const SizedBox(height: 60),
                ],
              ),
            );
          },
        );
      },
    );
  }

}


class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar _tabBar;

  _SliverAppBarDelegate(this._tabBar);

  @override
  double get minExtent => _tabBar.preferredSize.height;

  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white, // Background color for the TabBar
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}

