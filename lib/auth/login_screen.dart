import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:stack_food/auth/reg_screen.dart';
import 'package:stack_food/auth/view_model/login_view_model.dart';
import 'package:stack_food/navbar/bottom_navbar.dart';

import '../res/routes/routes_name.dart';
import '../widgets/dialogs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final loginController = Get.put(LoginViewModel());
  bool _obscureText = true;

  @override
  void initState() {
    // TODO: implement initState
    // Set the screen to full-screen mode
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: -90, // Adjust to align semi-circle correctly
            right: -90, // Adjust to align semi-circle correctly
            child: CustomPaint(
              size: const Size(190, 90), // Size of the semi-circle
              painter: SemiCircleForRightPainter(),
            ),
          ),

          Positioned(
            top: -90, // Adjust to align semi-circle correctly
            left: -5, // Adjust to align semi-circle correctly
            child: CustomPaint(
              size: const Size(160, 80), // Size of the semi-circle
              painter: SemiCirclePainter(),
            ),
          ),

          Positioned(
            top: -60, // Adjust to align semi-circle correctly
            left: -100, // Adjust to align semi-circle correctly
            child: CustomPaint(
              size: const Size(160, 80), // Size of the semi-circle
              painter: SemiDoubleCirclePainter(),
            ),
          ),

          Center(
            child: SingleChildScrollView(
              child: Form(
                key: loginController.formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                     Padding(
                      padding: const EdgeInsets.only(left: 10,bottom: 10),
                      child: Text("sign_in".tr,style: TextStyle(fontSize: 20,fontWeight: FontWeight.w700),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                           Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text("email".tr,style: TextStyle(color: Color(0xff9997a2)),),
                          ),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'enter_email_address'.tr,
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
                            controller: loginController.emailController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "email required".tr;
                              }
                              final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                              if (!emailRegex.hasMatch(value)) {
                                return "Invalid email".tr;
                              }
                              return null;
                            },
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
                            padding: const EdgeInsets.all(8.0),
                            child: Text("password".tr,style: const TextStyle(color: Color(0xff9997a2)),),
                          ),
              
                          TextFormField(
                            obscureText: _obscureText,
                            decoration: InputDecoration(
                              hintText: 'password'.tr,
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
                                suffixIcon: _obscureText==true?
                                IconButton(
                                    onPressed: (){
                                      setState(() {
                                        _obscureText=false;
                                      });
                                    },
                                    icon: const Icon(Icons.remove_red_eye_outlined)
                                ): IconButton(
                                    onPressed: (){
                                      setState(() {
                                        _obscureText=true;
                                      });
                                    },
                                    icon: const Icon(Icons.visibility_off_outlined)
                                )
              
                            ),
                            controller: loginController.passwordController,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "password required".tr;
                              }
                              if (value.length < 6) {
                                return "password too short".tr;
                              }
                              return null;
                            },
                          ),
                        ],
                      ),
                    ),
              
                     Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Text("forgot_password".tr,style: TextStyle(color: Color(0xffb80808,),fontSize: 15,),),
                        )
                    ),
              
                    Center(
                      child: ElevatedButton(
                          onPressed: loginController.login,
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 100),
                          backgroundColor: const Color(0xffb80808)
                        ),
                          child:  Text("sign_in".tr,style: TextStyle(color: Colors.white,fontSize: 20),),
                      ),
                    ),
              
                     Center(
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 30),
                          child: RichText(
                              text:  TextSpan(
                                text: "do_not_have_account".tr,
                                style: const TextStyle(color: Color(0xff5b5b5d,),fontSize: 15,),
                                children: [
                                  TextSpan(
                                      text: "sign_up".tr,
                                      style: const TextStyle(color: Color(0xffcc4a48)),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap=(){
                                        Get.to(RegScreen());
                                      }

                                  )
                                ]
                              ),
              
                          )
                        )
                    ),
              
                     Row(
                      children: [
                        const Expanded(child: Divider()),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text("or_continue_with".tr,style: TextStyle(color: Color(0xff5b5b5d,),fontSize: 15),),
                        ),
                        Expanded(child: Divider())
                      ],
                    ),
                    Padding(
                      padding:  const EdgeInsets.symmetric(vertical: 30),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: ()async{
                              final UserCredential user=await signInWithFb();
                              print(user);
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/icon/fb.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text("FACEBOOK"),
                                  )
                                ],
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              signInWithGoogle();
                            },
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.all(Radius.circular(30))
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Image.asset("assets/icon/g.png"),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8),
                                    child: Text("GOOGLE"),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
              
                  ],
                ),
              ),
            ),
          )
        ],
      ),

    );
  }


  Future<void> signInWithGoogle() async {
    try {
      // Check internet connectivity
      await InternetAddress.lookup('google.com');

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser == null) {
        // The user canceled the sign-in
        Dialogs.showMsgSnackBar(context,'Sign In',"Sign in aborted by user");
        return;
      }else{

        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

        // Create a new credential
        final AuthCredential credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        // Sign in to Firebase with the Google [UserCredential]
        final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
        final User? user = userCredential.user;

        if (user != null) {
          // If the user is new, you can save additional details to your backend or Firestore
          bool isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;
          if (isNewUser) {
            // Register the user in your backend if needed
            String name = user.displayName ?? '';
            String email = user.email ?? '';
            String phone = user.uid ?? '';




          } else {
            log('other');
            Get.offAndToNamed(RouteName.homeView);
          }
        }

      }


    } catch (e) {
      log('\nsignInWithGoogle: given exception $e');
    }
  }

  Future<UserCredential> signInWithFb()async{
    final LoginResult loginResult=await FacebookAuth.instance.login();
    final OAuthCredential oAuthCredential=FacebookAuthProvider.credential(loginResult.accessToken!.tokenString);
    return FirebaseAuth.instance.signInWithCredential(oAuthCredential);
  }


}

class SemiCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFFFECE6)
      ..style = PaintingStyle.fill;

    // Define the rectangle where the semi-circle will fit
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);

    // Draw the semi-circle
    canvas.drawArc(
      rect,
      0, // Start angle
      3.14, // Sweep angle (π radians for a half-circle)
      true, // Use center
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class SemiCircleForRightPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xffb80808)
      ..style = PaintingStyle.fill;

    // Define the rectangle where the semi-circle will fit
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);

    // Draw the semi-circle
    canvas.drawArc(
      rect,
      0, // Start angle
      3.14, // Sweep angle (π radians for a half-circle)
      true, // Use center
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class SemiDoubleCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xffb80808)
      ..style = PaintingStyle.fill;

    // Define the rectangle where the semi-circle will fit
    final rect = Rect.fromLTWH(0, 0, size.width, size.height * 2);

    // Draw the semi-circle
    canvas.drawArc(
      rect,
      6.8, // Start angle
      0.9, // Sweep angle (π radians for a half-circle)
      true, // Use center
      paint,
    );

    final paint1 = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    // Define the rectangle where the semi-circle will fit
    final rect1 = Rect.fromLTWH(30, 30, size.width-60, size.height * 2-60);

    // Draw the semi-circle
    canvas.drawArc(
      rect1,
      6.8, // Start angle
      0.8, // Sweep angle (π radians for a half-circle)
      true, // Use center
      paint1,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
