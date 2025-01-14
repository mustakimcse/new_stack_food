import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stack_food/data/network/network_api_service.dart';
import 'package:stack_food/navbar/bottom_navbar.dart';

import '../../res/app_url.dart';
import '../../res/routes/routes_name.dart';

class LoginViewModel extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _apiService = NetworkApiService();

  Future<void> login() async {
    if (formKey.currentState!.validate()) {
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final data = {
        'email': email,
        'password': password,
      };

      try {
        Get.dialog(
          const Center(child: CircularProgressIndicator()),
          barrierDismissible: false,
        );
        final response = await _apiService.postApi(data, AppUrl.loginApi);
        Get.back();
        // Handle login success
        // if (response['status'] == 'success') {
        //
        // } else {
        //   Get.snackbar('Error', response['message'] ?? 'Login failed');
        // }
        Get.offAndToNamed(RouteName.homeView);
      } catch (error) {
        Get.back();
        Get.snackbar('Error', error.toString());
      }
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
