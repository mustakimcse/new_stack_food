import 'package:flutter/material.dart';
import 'package:stack_food/model/upload_model.dart';

import '../model/setting_model.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {

  final List<SettingModel> settingList = [
    SettingModel(
      id: 1,
      name: "Privacy",
      iconImage: "assets/setting/shield-user.png",
    ),

    SettingModel(
      id: 1,
      name: "Refer & Earn",
      iconImage: "assets/setting/users-group-alt.png",
    ),

    SettingModel(
      id: 1,
      name: "Order History",
      iconImage: "assets/setting/time_past.png",
    ),

    SettingModel(
      id: 1,
      name: "Wallet",
      iconImage: "assets/setting/wallet.png",
    ),

    SettingModel(
      id: 1,
      name: "Get coins",
      iconImage: "assets/icon/bargar.png",
    ),

    SettingModel(
      id: 1,
      name: "Terms and condition",
      iconImage: "assets/setting/sticky-note-text-square.png",
    ),

    SettingModel(
      id: 1,
      name: "My delivery address",
      iconImage: "assets/setting/location-pin.png",
    ),

    SettingModel(
      id: 1,
      name: "Language",
      iconImage: "assets/setting/globe.png",
    ),

    SettingModel(
      id: 1,
      name: "Join as delivery man",
      iconImage: "assets/setting/truck.png",
    ),

    SettingModel(
      id: 1,
      name: "Request verification",
      iconImage: "assets/setting/award-star.png",
    ),

    SettingModel(
      id: 1,
      name: "help & support",
      iconImage: "assets/setting/info-circle.png",
    ),

    SettingModel(
      id: 1,
      name: "Log out",
      iconImage: "assets/setting/log-out.png",
    ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Upload"),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: CustomScrollView(
        slivers: [
          SliverList.builder(
              itemCount: settingList.length,
              itemBuilder: (context,index){
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Image.asset(settingList[index].iconImage,height: 20,fit: BoxFit.contain,),
                        ),
                        Text(settingList[index].name,
                          style: const TextStyle(color: Colors.black,fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                );
              }
          )
        ],
      ),
    );
  }
}
