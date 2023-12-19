import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:kt8/app/services/api_service.dart';
import 'package:kt8/app/services/auth_service.dart';
import 'package:kt8/app/services/storage_service.dart';
import 'app/routes/app_pages.dart';

void main() async {
  await initServices();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Cайт",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}

Future<void> initServices() async {
  await Get.putAsync(() => StorageService().init());
  await Get.putAsync(() => AuthService().init());
  await Get.putAsync(() => ApiService().init());
}
