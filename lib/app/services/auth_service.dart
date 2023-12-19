import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:kt8/app/core/constants.dart';
import 'package:kt8/app/data/models/jwt.dart';
import 'package:kt8/app/routes/app_pages.dart';
import 'package:kt8/app/services/storage_service.dart';

class AuthService extends GetxService {
  StorageService storageService = Get.find();
  late JWTModel _tokens;
  Dio client = Dio(BaseOptions(baseUrl: Constants.baseUrl));
  bool isAuth = false;

  String? get accessToken => _tokens.accessToken;

  Future<bool> refresh() async {
    try {
      var res = await client.post(ApiEndpoints.refresh, data: _tokens.toJson());
      print(res);
      var tokens = JWTModel.fromJson(res.data);
      await updateTokens(tokens);
      if (res.statusCode == 200) return true;
    } catch (e) {
      print(e);
    }
    isAuth = false;
    return false;
  }

  void logout() {
    isAuth = false;
    storageService.clear();
    _tokens = JWTModel(null, '');
    Get.offNamed(Routes.LOGIN);
  }

  Future<bool> comein(String email, String password) async =>
      _auth(email, password, ApiEndpoints.login);
  Future<bool> signup(String email, String password) async =>
      _auth(email, password, ApiEndpoints.registration);
  Future<bool> _auth(String email, String password, String path) async {
    try {
      var response = await client.post(path, data: {
        "email": email,
        "password": password,
      });
      var tokens = JWTModel.fromJson(response.data);
      await updateTokens(tokens);
      if (response.statusCode == 200) return true;
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<void> updateTokens(JWTModel tokens) async {
    _tokens = tokens;
    await storageService.writeRefresh(tokens.refreshToken);
  }

  Future<void> tryAuth() async {
    String refreshToken = storageService.getRefresh();
    var tokens = JWTModel(null, refreshToken);
    await updateTokens(tokens);
    if (tokens.refreshToken.isEmpty) {
      isAuth = false;
      return;
    } else {
      bool refreshResult = await refresh();
      isAuth = refreshResult;
    }
  }

  Future<AuthService> init() async {
    await tryAuth();
    return this;
  }
}
