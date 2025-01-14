import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:stack_food/res/routes/routes.dart';
import 'package:stack_food/screen/splash_screen.dart';

import 'auth/login_screen.dart';
import 'controller/loacl_translator_controller.dart';
import 'controller/translator_controller.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Initialize TranslatorController
  Get.put(TranslatorController());

  // Initialize AppTranslations
  final translations = AppTranslations();
  await translations.loadTranslations();

  runApp( MyApp(translations: translations,));
}

class MyApp extends StatelessWidget {
  final AppTranslations translations;
  const MyApp({super.key,required this.translations});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final translatorController = Get.find<TranslatorController>();
    return Obx((){
     return  GetMaterialApp(
          translations: translations,
          locale: translatorController.currentLocale.value,
          fallbackLocale:  const Locale('en'),
          title: 'Stack Food',
          debugShowCheckedModeBanner: false,
       getPages: AppRoutes.appRoutes(),
      );
    });
  }
}


