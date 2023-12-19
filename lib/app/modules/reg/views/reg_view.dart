import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/reg_controller.dart';

class RegView extends GetView<RegController> {
  const RegView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: <Widget>[
        IconButton(
            icon: Icon(
              Icons.assignment_ind,
              color: Color.fromARGB(255, 80, 126, 241),
            ),
            onPressed: () {})
      ], backgroundColor: Color.fromARGB(255, 193, 131, 245)),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            const Text(
              'Регистрация',
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 255, 255, 255)),
            ),
            const SizedBox(
              height: 60,
            ),
            SizedBox(
              width: 300.0,
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                controller: controller.mailController,
                decoration: const InputDecoration(
                    hintText: "Почта",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300.0,
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                controller: controller.passController,
                decoration: const InputDecoration(
                    hintText: "Пароль",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)))),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300.0,
              child: TextField(
                style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                controller: controller.passRepController,
                decoration: const InputDecoration(
                    hintText: "Повтори пароль",
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromARGB(255, 255, 255, 255)))),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 45,
              width: 150,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 228, 102, 245)),
                  onPressed: () => controller.registration(),
                  child: Text(
                    "РЕГИСТРАЦИЯ",
                    style: TextStyle(
                      color: Color.fromARGB(255, 235, 235, 235),
                      fontSize: 15,
                    ),
                  )),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromARGB(255, 230, 178, 202),
    );
  }
}
