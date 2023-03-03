import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:payroll_mob/app/modules/dashboard/views/dashboard_view.dart';

import '../../../utils/api.dart';

class LoginController extends GetxController {
  final client = http.Client();
  final authToken = GetStorage();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    emailController.dispose();
    passwordController.dispose();
  }

  void loginNow() async {
    try {
      final response = await client
          .post(Uri.parse('http://127.0.0.1:8000/api/login'), body: {
        'email': emailController.text,
        'password': passwordController.text,
      });

      if (response.statusCode == 200) {
        final jsonResponse = jsonDecode(response.body);
        if (jsonResponse['token'] != null) {
          authToken.write('token', jsonResponse['token']);
          authToken.write('full_name', jsonResponse['user']['name']);
          authToken.write('email', jsonResponse['user']['email']);
          authToken.write('role', jsonResponse['user']['username']);
          Get.offAll(() => const DashboardView());
        } else {
          Get.snackbar(
            'Error',
            jsonResponse['message'].toString(),
            icon: const Icon(Icons.error),
            backgroundColor: Colors.red,
            colorText: Colors.white,
            forwardAnimationCurve: Curves.bounceIn,
            margin: const EdgeInsets.only(
              top: 10,
              left: 5,
              right: 5,
            ),
          );
        }
      } else {
        Get.snackbar(
          'Error',
          'Failed to login. Please try again.',
          icon: const Icon(Icons.error),
          backgroundColor: Colors.red,
          colorText: Colors.white,
          forwardAnimationCurve: Curves.bounceIn,
          margin: const EdgeInsets.only(
            top: 10,
            left: 5,
            right: 5,
          ),
        );
      }
    } catch (e) {
      print(e.toString());
      Get.snackbar(
        'Error',
        'Failed to login. Please check your internet connection and try again.',
        icon: const Icon(Icons.error),
        backgroundColor: Colors.red,
        colorText: Colors.white,
        forwardAnimationCurve: Curves.bounceIn,
        margin: const EdgeInsets.only(
          top: 10,
          left: 5,
          right: 5,
        ),
      );
    } finally {
      client.close();
    }
  }
}
