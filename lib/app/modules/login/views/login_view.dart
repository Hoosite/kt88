import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.account_circle,
              color: Color.fromARGB(255, 0, 34, 53),
            ),
            onPressed: () {})
      ], backgroundColor: Color.fromARGB(255, 248, 223, 1)),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Вход',
              style:
                  TextStyle(fontSize: 30, color: Color.fromARGB(255, 0, 0, 0)),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 300.0,
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                controller: controller.mailController,
                decoration: const InputDecoration(
                    hintText: "Почта",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 168, 209, 130)))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300.0,
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                controller: controller.passController,
                decoration: const InputDecoration(
                    hintText: "Пароль",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 42, 255, 53)))),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 35,
              width: 70,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 245, 175, 110)),
                  onPressed: () => controller.login(),
                  child: Text(
                    "Вход",
                    style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      fontSize: 15,
                    ),
                  )),
            ),
            TextButton(
                onPressed: () => controller.toRegistration(),
                child: const Text(
                  'Регистрация',
                  style: TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0), fontSize: 20),
                ))
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 220, 236, 175),
    );
  }
}
