import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';

import 'auth_user.dart';

class AppUser extends GetxController {
  AuthUser? _user;

  bool get isUserLoggedPreviously => _user?.loginProviderToken != null;

  bool isUserLogged = false;

  int? _invoicesCount;

  int? get invoicesCount => _invoicesCount;
  AuthUser? get user => _user;
  static AppUser get init => Get.put(AppUser());
  static AppUser get instance => Get.find<AppUser>();

  Future<void> login(AuthUser user) async {
    await saveToken(user.loginProviderToken);
    isUserLogged = true;
    _user = user;
  }

  Future<void> saveToken(String? token) async {
    const storage = FlutterSecureStorage();

    await storage.write(key: 'token', value: token);
  }

  Future<String?> get getToken async {
    const storage = FlutterSecureStorage();
    return await storage.read(key: 'token');
  }

  Future<void> logout() async {
    isUserLogged = false;
    _user = null;
  }
}
