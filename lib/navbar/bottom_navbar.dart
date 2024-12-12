
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:stack_food/screen/explore_screen.dart';
import 'package:stack_food/screen/profile/cart_screen.dart';
import 'package:stack_food/screen/setting_screen.dart';
import 'package:stack_food/screen/upload_screen.dart';

import '../screen/home_screen.dart';



class BottomNavBar extends StatefulWidget {

  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int currentTab=0;

  int selectedIndex = 0;
  late DateTime currentBackPressTime;

  final PageStorageBucket bucket=PageStorageBucket();
  Widget currentScreen=HomeScreen();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      bottomNavigationBar:BottomAppBar(
        shape: const CircularNotchedRectangle(),
        height: 65,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            MaterialButton(
              minWidth: 60,
              onPressed: (){
                setState(() {
                  currentScreen=HomeScreen();
                  currentTab=0;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icon/home-dash.png",color: currentTab==0?Color(0xFFb80808):Color(0xff677082),),
                  Text(
                    'Home',
                    style: TextStyle(
                        color: currentTab==0?Color(0xFFb80808):Color(0xff677082),fontSize: 10
                    ),
                  )
                ],
              ),
            ),
            MaterialButton(
              minWidth: 60,
              onPressed: (){
                setState(() {
                  currentScreen=ExploreScreen();
                  currentTab=1;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icon/grid-web-7.png"),
                  Text(
                    'Explore',
                    style: TextStyle(
                        color: currentTab==1?Color(0xFFb80808):Color(0xff677082),fontSize: 10
                    ),
                  )
                ],
              ),
            ),
            MaterialButton(
              padding: EdgeInsets.zero,
              minWidth: 60,
              onPressed: (){
                setState(() {
                  currentScreen=CartScreen();
                  currentTab=2;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Image.asset("assets/icon/shopping-bag.png"),

                  Text(
                    'Cart',
                    style: TextStyle(
                        color: currentTab==3?Color(0xFFb80808):Color(0xff677082),fontSize: 10
                    ),
                  )
                ],
              ),
            ),
            MaterialButton(
              minWidth: 60,
              onPressed: ()async{
                setState(() {
                  currentScreen=const UploadScreen();
                  currentTab=3;
                });
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icon/upload.png"),
                  Text(
                    'Upload',
                    style: TextStyle(
                        color: currentTab==4?Color(0xFFb80808):Color(0xff677082),fontSize: 10
                    ),
                  )
                ],
              ),
            ),
            MaterialButton(
              minWidth: 60,
              onPressed: ()async{
                setState(() {
                  currentScreen=const SettingScreen();
                  currentTab=3;
                });

              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icon/settings.png"),
                  Text(
                    'Settings',
                    style: TextStyle(
                        color: currentTab==4?Color(0xFFb80808):Color(0xff677082),fontSize: 10
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),

      body: PageStorage(
          bucket: bucket,
          child: currentScreen,
        ),

    );
  }

}
