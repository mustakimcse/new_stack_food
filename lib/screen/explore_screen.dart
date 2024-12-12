import 'package:flutter/material.dart';

import '../model/category_model.dart';
import '../model/following_model.dart';
import '../model/trades_model.dart';
import '../widgets/following_widget.dart';
import '../widgets/trade_widget.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  final List<String> typeList = ['All', 'Thai', 'Top Trades', 'Gluten Free'];
  int selectedIndex = 0; // Track the selected index

  final List<CategoryModel> categoryList = [
    CategoryModel(
      id: 1,
      name: "Gourmet Kitchen",
      foodImage: "assets/cat/cat1.png",
    ),
    CategoryModel(
      id: 2,
      name: "Foodie's Delight",
      foodImage: "assets/cat/cat2.png",
    ),

    CategoryModel(
      id: 2,
      name: "Foodie's Delight",
      foodImage: "assets/cat/cat3.png",
    ),

    CategoryModel(
      id: 2,
      name: "Foodie's Delight",
      foodImage: "assets/cat/cat4.png",
    ),
    CategoryModel(
      id: 2,
      name: "Foodie's Delight",
      foodImage: "assets/cat/cat5.png",
    ),
    CategoryModel(
      id: 2,
      name: "Foodie's Delight",
      foodImage: "assets/cat/cat6.png",
    ),
    CategoryModel(
      id: 2,
      name: "Foodie's Delight",
      foodImage: "assets/cat/cat7.png",
    ),
    CategoryModel(
      id: 2,
      name: "Foodie's Delight",
      foodImage: "assets/cat/cat8.png",
    ),
    CategoryModel(
      id: 2,
      name: "Foodie's Delight",
      foodImage: "assets/cat/cat9.png",
    ),

  ];

  final List<FollowingModel> following = [
    FollowingModel(
      id: 1,
      name: "Gourmet Kitchen",
      manName: 'Md.Mustakim',
      foodImage: "assets/food/res4.png",
      restImage: "assets/shafe/shafe1.png",
      time: "10:00 AM",
      leftTime: "2 hours",
      currentPrice: 150,

    ),
    FollowingModel(
      id: 2,
      name: "Foodie's Delight",
      manName: "Rajiya",
      foodImage: "assets/food/res5.png",
      restImage: "assets/man/per2.png",
      time: "12:00 PM",
      leftTime: "1 hour",
      currentPrice: 120,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Explore"),
        centerTitle: true,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Image.asset("assets/icon/bell.png"),
          ),
        ],
      ),
      body: CustomScrollView(
        slivers: [

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 8,bottom: 16),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Find a local meal...',
                        hintStyle: TextStyle(color: Colors.grey.shade500),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:  BorderSide(color: Color(0xffdddddd)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:  BorderSide(color: Color(0xffdddddd)),
                        ),

                        disabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:  BorderSide(color: Color(0xffdddddd)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                          borderSide:  BorderSide(color: Color(0xffdddddd)),
                        ),
                        filled: true,
                        contentPadding: EdgeInsets.zero,
                        fillColor: Colors.white,
                        prefixIcon: Image.asset("assets/icon/search.png"),
                      ),
                      readOnly: false,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Color(0xffb80808)
                      ),
                      child: Image.asset("assets/icon/filter.png"),
                    ),
                  )
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: typeList.length,
                  itemBuilder: (context,index){
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = index;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.only(left: 16,right: 16),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                          color: selectedIndex == index
                              ? const Color(0xFFb80808) // Selected color
                              : Colors.transparent, // Default color
                        ),

                        child: Text(
                          typeList[index],
                          style: TextStyle(
                            fontSize: 16,
                            color: selectedIndex == index
                                ? Colors.white // Text color for selected
                                : Colors.black, // Text color for unselected
                          ),
                        ),
                      ),
                    );
                  }
              ),
            ),
          ),

          SliverGrid.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                crossAxisSpacing: 0,
                mainAxisSpacing: 0,

              ),
              itemCount: categoryList.length,
              itemBuilder: (context,index){
                return Image.asset(categoryList[index].foodImage);
              }
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
                  (context, index) {
                final restaurant = following[index];
                return FollowingWidget(
                  id: restaurant.id,
                  name: restaurant.name,
                  manName: restaurant.manName,
                  foodImage: restaurant.foodImage,
                  RestImage: restaurant.restImage,
                  time: restaurant.time,
                  leftTime: restaurant.leftTime,
                  currentPrice: restaurant.currentPrice,

                );
              },
              childCount: following.length, // Number of restaurants in the list
            ),
          ),

        ],
      ),
    );
  }
}
