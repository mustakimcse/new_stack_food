
import 'package:get/get.dart';
import 'package:stack_food/auth/login_screen.dart';
import 'package:stack_food/navbar/bottom_navbar.dart';
import 'package:stack_food/res/routes/routes_name.dart';
import 'package:stack_food/screen/splash_screen.dart';

class AppRoutes{
  static appRoutes()=>[
    GetPage(name: RouteName.splashScreen, page: ()=>const SplashScreen()),
    GetPage(name: RouteName.loginView, page: ()=>const LoginScreen()),
    GetPage(name: RouteName.homeView, page: ()=>const BottomNavBar())
  ];
}