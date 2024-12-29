
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:ui';

class TranslatorController extends GetxController {
  static const String _languageKey = 'selected_language';
  static const String _languageSelectedFlag = 'language_selected';

  var currentLocale = const Locale('en').obs;

  TranslatorController() {
    _loadSavedLanguage();
  }

  void changeLanguage(String languageCode) async {
    currentLocale.value = Locale(languageCode);
    Get.updateLocale(currentLocale.value);

    // Save the selected language and the flag locally
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, languageCode);
    await prefs.setBool(_languageSelectedFlag, true); // Mark as selected
  }

  Future<void> _loadSavedLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedLanguageCode = prefs.getString(_languageKey);

    if (savedLanguageCode != null) {
      currentLocale.value = Locale(savedLanguageCode);
      Get.updateLocale(currentLocale.value);
    }
  }

  Future<bool> isLanguageSelected() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_languageSelectedFlag) ?? false;
  }
}

