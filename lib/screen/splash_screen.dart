
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stack_food/auth/login_screen.dart';

import '../controller/loacl_translator_controller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  String? selectedLanguage = 'en';

  @override
  void initState() {
    // TODO: implement initState

    // Set the screen to full-screen mode
    // SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
    // SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    // Future.delayed(Duration(seconds: 2),(){
    //   Get.off(LoginScreen());
    // });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final translatorController = Get.find<TranslatorController>();
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
          //bottom
          Positioned(
            bottom: 5, // Adjust to align semi-circle correctly
            right: -90, // Adjust to align semi-circle correctly
            child: CustomPaint(
              size: const Size(190, 90), // Size of the semi-circle
              painter: SemiCircleBottomRightPainter(),
            ),
          ),

          Positioned(
            bottom: 0, // Adjust to align semi-circle correctly
            left: -5, // Adjust to align semi-circle correctly
            child: CustomPaint(
              size: const Size(190, 90), // Size of the semi-circle
              painter: SemiCircleForBottomTopPainter(),
            ),
          ),

          Positioned(
            bottom: 20, // Adjust to align semi-circle correctly
            left: -100, // Adjust to align semi-circle correctly
            child: CustomPaint(
              size: const Size(160, 80), // Size of the semi-circle
              painter: SemiDoubleBottomCirclePainter(),
            ),
          ),

          Center(child: Image.asset("assets/yeloooo.png")),

          // Main content

          Positioned(
            bottom: 200,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Obx((){
                  return DropdownButton<String>(
                    value: translatorController.currentLocale.value.languageCode,
                    onChanged: (value) {
                      translatorController.changeLanguage(value!);
                    },
                    items: const [
                      DropdownMenuItem(
                        value: 'en',
                        child: Text('English'),
                      ),
                      DropdownMenuItem(
                        value: 'bn',
                        child: Text('বাংলা'),
                      ),
                    ],
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                    underline: Container(
                      height: 2,
                      color: Colors.redAccent,
                    ),
                    icon: const Icon(Icons.language),
                  );
                }),
                ElevatedButton(
                    onPressed: (){
                      Get.off(LoginScreen());
                    },
                    child: Text("next".tr)
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Future<void> signInWithGoogle() async {
  //   try {
  //     // Check internet connectivity
  //     await InternetAddress.lookup('google.com');
  //
  //     // Trigger the authentication flow
  //     final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  //
  //     if (googleUser == null) {
  //       // The user canceled the sign-in
  //       Dialogs.showMsgSnackBar('', "Sign in aborted by user");
  //       return;
  //     }else{
  //       // log(googleUser.toString());
  //     }
  //
  //     // Obtain the auth details from the request
  //     final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
  //
  //     // Create a new credential
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     // Sign in to Firebase with the Google [UserCredential]
  //     final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
  //     final User? user = userCredential.user;
  //
  //     if (user != null) {
  //       // If the user is new, you can save additional details to your backend or Firestore
  //       bool isNewUser = userCredential.additionalUserInfo?.isNewUser ?? false;
  //
  //       if (isNewUser) {
  //         // Register the user in your backend if needed
  //         String name = user.displayName ?? '';
  //         String email = user.email ?? '';
  //         String phone = user.uid ?? '';
  //         //log(phone);
  //
  //
  //         // Assuming your backend API handles Google sign-up
  //         //registration(name, email, phone, ''); // Password is not needed for Google Sign-In
  //         //log(user.toString());
  //
  //
  //       } else {
  //         log('${user}');
  //         const url='${BaseUrlAndSecret.baseUrl}social-auth?${BaseUrlAndSecret.secret}';
  //         final uri=Uri.parse(url);
  //         final body={
  //           'email':user.email,
  //           'google_id':user.uid
  //         };
  //
  //         try{
  //           final response=await http.post(uri,body: body);
  //           if(response.statusCode==200){
  //             final getBody = response.body;
  //             final Map<String,dynamic> responseBody=jsonDecode(getBody);
  //             final message=responseBody['message'];
  //             final status=responseBody['type'];
  //             if(status=='success'){
  //               final token=responseBody['access_token'];
  //               sessionController.saveSession(token);
  //               Get.snackbar(message, message);
  //               Get.off(const BottomNavBar(),transition: Transition.rightToLeft);
  //             }else{
  //               Get.snackbar(message, message);
  //             }
  //           }
  //         }catch (e){
  //           log(e.toString());
  //         }
  //
  //
  //       }
  //     }
  //   } catch (e) {
  //     log('\nsignInWithGoogle: given exception $e');
  //
  //   }
  // }
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

//for bottom

class SemiCircleBottomRightPainter extends CustomPainter {
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
      2.5, // Start angle
      3.1, // Sweep angle (π radians for a half-circle)
      true, // Use center
      paint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}

class SemiCircleForBottomTopPainter extends CustomPainter {
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
      3.15, // Start angle
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

class SemiDoubleBottomCirclePainter extends CustomPainter {
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
      4.3, // Start angle
      1.2, // Sweep angle (π radians for a half-circle)
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
      4.6, // Start angle
      0.9, // Sweep angle (π radians for a half-circle)
      true, // Use center
      paint1,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
