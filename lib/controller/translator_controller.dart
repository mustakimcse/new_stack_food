import 'dart:convert';
import 'dart:ui';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppTranslations extends Translations {
  final Map<String, Map<String, String>> translations = {};

  AppTranslations();

  Future<void> loadTranslations() async {
    translations['en'] = await _loadJsonFile('assets/language/en.json');
    translations['bn'] = await _loadJsonFile('assets/language/bn.json');
  }

  Future<Map<String, String>> _loadJsonFile(String path) async {
    String data = await rootBundle.loadString(path);
    Map<String, dynamic> jsonResult = jsonDecode(data);
    return jsonResult.map((key, value) => MapEntry(key, value.toString()));
  }

  @override
  Map<String, Map<String, String>> get keys => translations;
}
