import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stack_food/widgets/custom_button.dart';

class ProfileUpdateScreen extends StatefulWidget {
  const ProfileUpdateScreen({super.key});

  @override
  State<ProfileUpdateScreen> createState() => _ProfileUpdateScreenState();
}

class _ProfileUpdateScreenState extends State<ProfileUpdateScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Image.asset(
                  "assets/food/res4.png",
                  fit: BoxFit.cover, // Ensure it covers the space nicely
                  height: 300.0, // Match the AppBar's expandedHeight
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
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Image.asset("assets/icon/upload1.png"),
                      ),
                      const SizedBox(width: 10),
                      InkWell(
                        onTap: (){

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
                  bottom: 20,
                  right: 20,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: const Color(0xfffe4487),
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.white,
                        width: 4,
                      ),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      color: Colors.white,
                      size: 20,
                    ),
                  ),
                ),

                Positioned(
                  bottom: -50,
                  left: MediaQuery.of(context).size.width / 2 - 50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: Container(
                            width: 100, // Fixed width
                            height: 100,
                            color: Colors.grey[200],
                            child: Image.asset(
                              "assets/man/per3.png",
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),

                        Positioned(
                          bottom: -20,
                          left: 0,
                          right: 0,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.white,
                                width: 4,
                              ),
                            ),
                            child: Icon(
                              Icons.camera_alt,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),


              ],
            ),
          ),


          SliverToBoxAdapter(
            child: Column(
              children: [

                SizedBox(height: 60,),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("full_name".tr,style: TextStyle(color: Color(0xff9997a2)),),
                      ),
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'full_name'.tr,
                          filled: true,
                          fillColor: Colors.white,
                          hintStyle: TextStyle(color: Color(0xffc4c4c4)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            borderSide: const BorderSide(
                              color: Color(0xffeeeeee), // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            borderSide: const BorderSide(
                              color: Color(0xffeeeeee), // Border color for enabled state
                              width: 1.0, // Border width
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            borderSide: const BorderSide(
                              color: Color(0xffeeeeee), // Border color for focused state
                              width: 1.0, // Border width
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("user_name".tr,style: TextStyle(color: Color(0xff9997a2)),),
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'user_name'.tr,
                          filled: true,
                          hintStyle: TextStyle(color: Color(0xffc4c4c4)),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            borderSide: const BorderSide(
                              color: Color(0xffeeeeee), // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            borderSide: const BorderSide(
                              color: Color(0xffeeeeee), // Border color for enabled state
                              width: 1.0, // Border width
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            borderSide: const BorderSide(
                              color: Color(0xffeeeeee), // Border color for focused state
                              width: 1.0, // Border width
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text("bio".tr,style: TextStyle(color: Color(0xff9997a2)),),
                      ),

                      TextFormField(
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'bio_info'.tr,
                          filled: true,
                          hintStyle: TextStyle(color: Color(0xffc4c4c4)),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            borderSide: const BorderSide(
                              color: Color(0xffeeeeee), // Border color
                              width: 1.0, // Border width
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            borderSide: const BorderSide(
                              color: Color(0xffeeeeee), // Border color for enabled state
                              width: 1.0, // Border width
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0), // Rounded corners
                            borderSide: const BorderSide(
                              color: Color(0xffeeeeee), // Border color for focused state
                              width: 1.0, // Border width
                            ),
                          ),

                        ),
                      ),
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 50),
                  child: CustomButton(
                      child: const Text("Save",style: TextStyle(fontSize: 18,color: Colors.white),),
                      onPressed: (){}
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

}


