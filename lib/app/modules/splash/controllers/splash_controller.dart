import 'package:get/get.dart';
import 'package:kt8/app/routes/app_pages.dart';
import 'package:kt8/app/services/auth_service.dart';

class SplashController extends GetxController {
  AuthService authService = Get.find();

  @override
  void onReady() async {
    await authService.tryAuth();
    if (authService.isAuth) {
      Get.offAllNamed(Routes.HOME);
    } else {
      Get.offAllNamed(Routes.LOGIN);
    }
    super.onReady();
  }
}
