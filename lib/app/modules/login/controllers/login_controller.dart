import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kt8/app/routes/app_pages.dart';
import 'package:kt8/app/services/api_service.dart';

import 'package:kt8/app/services/auth_service.dart';

class LoginController extends GetxController {
  ApiService apiService = Get.find();
  AuthService authService = Get.find();
  var mailController = TextEditingController();
  var passController = TextEditingController();
  login() async {
    bool res =
        await authService.comein(mailController.text, passController.text);
    if (res) {
      authService.isAuth = true;
      Get.toNamed(Routes.HOME);
      print('Login is successful');
    } else {
      print('Login is unsuccessful');
    }
  }

  toRegistration() => Get.toNamed(Routes.REG);
}
