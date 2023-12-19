import 'dart:io';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';
import 'package:kt8/app/core/constants.dart';
import 'package:kt8/app/services/auth_service.dart';
import 'package:kt8/app/services/storage_service.dart';

class ApiService extends GetxService {
  StorageService storageService = Get.find();
  AuthService authService = Get.find();

  Dio client = Dio(BaseOptions(
    baseUrl: Constants.baseUrl,
  ));

  Future<String> getUser() async => (await client.get('')).data;

  Future<ApiService> init() async {
    client.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        options.headers.addAll({
          HttpHeaders.authorizationHeader: "Bearer ${authService.accessToken}"
        });
        handler.next(options);
      },
      onError: (DioException e, ErrorInterceptorHandler handler) async {
        if (e.response?.statusCode == HttpStatus.unauthorized &&
            !e.response?.extra['isRetry']) {
          if (await authService.refresh()) {
            var newRequest = await client.fetch(e.requestOptions.copyWith(
              extra: {"isRetry": true},
            ));
            handler.resolve(newRequest);
          }
        }
        handler.reject(e);
      },
    ));
    return this;
  }
}
