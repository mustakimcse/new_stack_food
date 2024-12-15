import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:stack_food/controller/cart_controller.dart';

class FoodScreen extends StatefulWidget {
  const FoodScreen({super.key});

  @override
  State<FoodScreen> createState() => _FoodScreenState();
}

class _FoodScreenState extends State<FoodScreen> {

  final cardController=Get.put(CartController());

  int quantity = 1; // Initialize quantity

  void incrementQuantity() {
    setState(() {
      quantity++; // Increment quantity
    });
  }

  void decrementQuantity() {
    setState(() {
      if (quantity > 1) quantity--; // Decrement quantity, ensure it's >= 1
    });
  }




  String? selectedSize = "S"; // Default selected size
  // List of sizes with prices
  final List<Map<String, dynamic>> sizeList = [
    {"size": "S", "name": "Small", "price": 5.30},
    {"size": "M", "name": "Medium", "price": 7.30},
    {"size": "L", "name": "Large", "price": 9.30},
  ];


  String? selectedType = "S";
  // List of sizes with prices
  final List<Map<String, dynamic>> typeList = [
    {"value": "S", "name": "Baby spinach", "price": 2.30,"image":"assets/food/res14"},
    {"value": "M", "name": "Mushroom", "price": 2.30,"image":"assets/food/res15"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    child: Image.asset(
                      "assets/food/res4.png",
                      fit: BoxFit.cover, // Ensure it covers the space nicely
                      height: 300.0, // Match the AppBar's expandedHeight
                    ),
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

                        },
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Color(0xfffe734c),
                            borderRadius: BorderRadius.all(Radius.circular(35))
                          ),
                            child: Icon(Icons.favorite,color: Colors.white,)
                        ),
                      ),
                    ],
                  ),
                ),


              ],
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Chicken Hawaiian",style: TextStyle(fontSize: 20),),

                  Row(
                    children: [
                      const Icon(Icons.star,color: Colors.orangeAccent,),
                      const SizedBox(width: 10,),
                      const Text("4.5",style: TextStyle(fontSize: 18),),
                      const SizedBox(width: 5,),
                      const Text("(30+)",style: TextStyle(color: Color(0xff9896a1)),),
                      Spacer(),

                      Row(
                        children: [
                          // Decrease Button (-)
                          InkWell(
                            onTap:decrementQuantity,
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
                          Container(
                            width: 40,
                            height: 30,
                            alignment: Alignment.center,

                            child:  Text(
                              "$quantity",
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'RobotoR',
                              ),
                            ),
                          ),

                          // Increase Button (+)
                          InkWell(
                            onTap:incrementQuantity,
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
                  SizedBox(height: 20,),

                  const Text("Brown the beef better. Lean ground beef – "
                      "I like to use 85% lean angus. Garlic – use fresh  chopped. Spices – chili powder, "
                      "cumin, onion powder.",style: TextStyle(color: Color(0xff9896a1),fontSize: 16),),
                  Divider(),

                  //size start
                  const Row(
                    children: [
                      Text(
                        "Select Size",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),

                      Text(
                        "  (Required)",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),

                  Column(
                    children: [
                      for (var size in sizeList)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Size Name
                              Text(
                                size["name"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  // Price
                                  Text(
                                    "\$${size["price"].toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  // Radio Button
                                  Radio<String>(
                                    value: size["size"],
                                    groupValue: selectedSize,
                                    activeColor: Colors.red, // Selected radio color
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedSize = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  //size end
                  Divider(),
                  //type start
                  const Row(
                    children: [
                      Text(
                        "Add On",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),

                      Text(
                        "  (Optional)",
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),

                  Column(
                    children: [
                      for (var type in typeList)
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              // Size Name
                              Text(
                                type["name"],
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              Row(
                                children: [
                                  // Price
                                  Text(
                                    "\$${type["price"].toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontSize: 16,
                                      color: Colors.grey,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  // Radio Button
                                  Radio<String>(
                                    value: type["value"],
                                    groupValue: selectedSize,
                                    activeColor: Colors.red, // Selected radio color
                                    onChanged: (String? value) {
                                      setState(() {
                                        selectedType = value;
                                      });
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                    ],
                  ),
                  Divider(),
                  //type end
                  SizedBox(height: 10,),
                  Row(
                    children: [
                      Text("Total",style: TextStyle(fontSize: 18),),
                      Spacer(),
                      Text("\$18.45",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  )
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 50,),
          ),

          SliverToBoxAdapter(
            child: Center(
              child: ElevatedButton(
                onPressed: (){

                },
                style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 100),
                    backgroundColor: const Color(0xffb80808)
                ),
                child:  Text("Add to Cart",style: TextStyle(color: Colors.white,fontSize: 20),),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: SizedBox(height: 100,),
          )
        ],
      ),
    );
  }
}
