import 'package:flutter/material.dart';

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
                  top: 90,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset("assets/man/per3.png"),
                  ),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}
