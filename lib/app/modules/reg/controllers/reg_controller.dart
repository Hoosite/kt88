import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kt8/app/routes/app_pages.dart';
import 'package:kt8/app/services/auth_service.dart';

class RegController extends GetxController {
  AuthService authService = Get.find();
  var mailController = TextEditingController();
  var passController = TextEditingController();
  var passRepController = TextEditingController();

  void registration() async {
    if (passController.text != passRepController.text) {
      showSnack("Пароль неверный");
      return;
    }
    if (passController.text.length < 8) {
      showSnack("Пароль должен содержать больше 8 символов");
      return;
    }
    if (!mailController.text.contains("@")) {
      showSnack("Неверный Email");
      return;
    }
    bool res =
        await authService.signup(mailController.text, passController.text);
    if (res) {
      authService.isAuth = true;
      Get.toNamed(Routes.HOME);
      showSnack("Регистрация успешна", isError: false);
    } else {
      showSnack('Регистрация НЕ успешна');
    }
  }

  void showSnack(String message, {isError = true}) {
    Get.showSnackbar(GetSnackBar(
      message: message,
      backgroundColor: isError ? Colors.red : Colors.green,
      duration: const Duration(seconds: 1),
    ));
  }
}
