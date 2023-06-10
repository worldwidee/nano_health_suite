import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:nano_health_suite/core/states/app_settings/appearance.dart';
import 'package:nano_health_suite/core/states/app_user/app_user.dart';
import 'package:nano_health_suite/product/service/auth/auth_service.dart';

import '../../../product/service/general/general_service.dart';
import '../../../product/utility/shared_manager.dart';

class AppSettings extends GetxController {
  AppSettings() {
    listenInternetConnection();
    _generalService = GeneralService();
    _authService = AuthService();
  }

  late Appearance _appearance;

  late final GeneralService _generalService;

  late final AuthService _authService;

  late SharedPreferencesManager _sharedPreferencesManager;

  BuildContext? _context;

  late bool _isDeviceConnected;

  BuildContext? get context => _context;
  GeneralService get generalService => _generalService;
  AuthService get authService => _authService;
  bool get isDeviceConnected => _isDeviceConnected;
  Appearance get appearance => _appearance;
  SharedPreferencesManager get sharedPreferencesManager =>
      _sharedPreferencesManager;

  static AppSettings get instance => Get.find<AppSettings>();

  Future<void> setup({required bool autoAuth}) async {
    await AppUser.instance.checkAuth();
    await initSharedReferences();
    String? appearanceName = getAppearanceFromShared() ?? "light";
    if (appearanceName == "light") {
      _appearance = Appearance.light();
    } else {
      _appearance = Appearance.dark();
    }
  }

  void updateContext(BuildContext context) {
    _context = context;
  }

  void changeTheme() {
    _appearance =
        appearance.name == "dark" ? Appearance.light() : Appearance.dark();
    update();
  }

  Future<void> checkConnection() async {
    _isDeviceConnected = await InternetConnectionChecker().hasConnection;
  }

  void listenInternetConnection() {
    InternetConnectionChecker().onStatusChange.listen((status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          _isDeviceConnected = true;
          update();
          break;
        case InternetConnectionStatus.disconnected:
          _isDeviceConnected = false;
          update();
          break;
      }
    });
  }

  Future<void> initSharedReferences() async {
    _sharedPreferencesManager = SharedPreferencesManager();
    await _sharedPreferencesManager.init();
  }

  String? getAppearanceFromShared() {
    return _sharedPreferencesManager.getAppearance;
  }

  Future<void> saveAppearance(String name) async {
    await _sharedPreferencesManager.updateAppearance(name);
  }

  static AppSettings init() {
    return Get.put(AppSettings());
  }
}
