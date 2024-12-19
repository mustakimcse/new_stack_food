
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class TranslatorController extends GetxController {
  static const String _languageKey = 'selected_language';

  var currentLocale = const Locale('en').obs;

  TranslatorController() {
    _loadSavedLanguage(); // Load the saved language when the controller is created
  }

  void changeLanguage(String languageCode) async {
    currentLocale.value = Locale(languageCode);
    Get.updateLocale(currentLocale.value);

    // Save the selected language locally
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
  }

  Future<void> _loadSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguageCode = prefs.getString(_languageKey);

    if (savedLanguageCode != null) {
      currentLocale.value = Locale(savedLanguageCode);
      Get.updateLocale(currentLocale.value);
    }
  }
}
