import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:stack_food/auth/login_screen.dart';
import 'package:stack_food/data/network/network_api_service.dart';
import 'package:stack_food/navbar/bottom_navbar.dart';
import 'package:stack_food/res/routes/routes_name.dart';

import '../../data/app_exception.dart';
import '../../res/app_url.dart';

class RegViewModel extends GetxController {
  final fullNameController = TextEditingController();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final _apiService = NetworkApiService();

  Future<void> registration() async {
    if (formKey.currentState!.validate()) {
      final fullName=fullNameController.text.trim();
      final userName=userNameController.text.trim();
      final email = emailController.text.trim();
      final password = passwordController.text.trim();

      final data = {
        'full_name':fullName,
        'username':userName,
        'email': email,
        'password': password,
      };


      try {
        Get.dialog(
          const Center(child: CircularProgressIndicator()),
          barrierDismissible: false,
        );
        final response = await _apiService.postApi(data, AppUrl.regApi);
        print('Response: ${response}');
        Get.back();
        // Handle login success
        // if (response['status'] == 'success') {
        //
        // } else {
        //   Get.snackbar('Error', response['message'] ?? 'Login failed');
        // }

        Get.snackbar('Error', response['message'] ?? 'Login failed');

        if(response['message']=='Registration Successfully!'){
          Get.toNamed(RouteName.loginView);
        }

      } catch (error) {
        Get.back();
        if (error is BadRequestException) {
          if (error.errorResponse is Map<String, dynamic>) {
            final errorMessages = error.errorResponse as Map<String, dynamic>;
            final messages = errorMessages.entries
                .map((entry) =>
            "${entry.key}: ${(entry.value as List).join(', ')}")
                .join('\n');
            Get.snackbar('Error', messages);
          } else {
            Get.snackbar('Error', error.toString());
          }
        } else {
          Get.snackbar('Error', error.toString());
        }

      }
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
