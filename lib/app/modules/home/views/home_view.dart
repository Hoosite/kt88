import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ДОМ',
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () => controller.logout(),
              icon: const Icon(
                Icons.logout,
                color: Color.fromARGB(255, 0, 8, 12),
              ))
        ],
        backgroundColor: Color.fromARGB(255, 120, 231, 166),
      ),
      body: Center(
        child: Obx(() => Text(
              controller.welcometext.value,
              style: TextStyle(
                  fontSize: 20, color: Color.fromARGB(255, 201, 247, 171)),
            )),
      ),
      backgroundColor: Color.fromARGB(255, 165, 203, 224),
    );
  }
}
