// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:mobx/mobx.dart';
import 'package:nano_health_suite/core/extensions/string_extensions.dart';
import 'package:nano_health_suite/core/init/navigation/navigation_enum.dart';
import 'package:nano_health_suite/core/init/navigation/navigation_extension.dart';
import 'package:nano_health_suite/core/states/app_settings/app_settings.dart';
import 'package:nano_health_suite/core/states/app_user/app_user.dart';
import 'package:nano_health_suite/core/states/app_user/auth_user.dart';
import 'package:nano_health_suite/product/init/extensions/response_model.dart';
import 'package:nano_health_suite/product/model/login/login_parameter.dart';
import 'package:nano_health_suite/product/service/auth/auth_service.dart';

import '../../../init/enum/service_status.dart';
import '../../../widgets/bottom_sheet/error_bottom_sheet.dart';
part 'login_view_model.g.dart';

class LoginViewModel = _LoginViewModelBase with _$LoginViewModel;

abstract class _LoginViewModelBase with Store {
  final AuthService _authService = AppSettings.instance.authService;

  @observable
  ServiceStatus serviceStatus = ServiceStatus.waiting;

  @observable
  String? errorTextEmail;

  @observable
  bool obscureText = true;

  @observable
  String? errorTextPassword;

  bool get errorEmail => errorTextEmail != null;
  bool get errorPassword => errorTextEmail != null;

  @action
  void updateObscureText() {
    obscureText = !obscureText;
  }

  @action
  void validateUsername(String value) {
    errorTextEmail = value.isValidUserName;
  }

  @action
  void validatePassword(String value) {
    errorTextPassword = value.isValidPassword;
  }

  bool get isValid => errorTextEmail == null && errorTextPassword == null;

  Future<void> login(
      {required String username,
      required String password,
      required BuildContext context}) async {
    validateUsername(username);
    validatePassword(password);
    if (isValid) {
      serviceStatus = ServiceStatus.onProcess;
      var response = await _authService
          .login(LoginParameter(username: username, password: password));
      switch (response.responseType) {
        case ResponseType.hasData:
          serviceStatus = ServiceStatus.success;
          await AppUser.instance.login(AuthUser(
              username: username,
              password: password,
              loginProviderToken: response.data!.token!));
          context.go(NavigationEnums.home.route);
          break;
        case ResponseType.errorModelWithData:
          serviceStatus = ServiceStatus.failed;
          ErrorBottomSheet.customView(
              title: "Login Error!",
              message: "Your username or password is incorrect",
              context: context);
          break;
        case ResponseType.errorModelWithoutData:
          serviceStatus = ServiceStatus.failed;
          ErrorBottomSheet.customView(
              title: "Something Went Wrong",
              message: "Something went wrong during login process",
              context: context);
          break;
        case ResponseType.noConnection:
          serviceStatus = ServiceStatus.failed;
          ErrorBottomSheet.listenConnection(
              context: context, onConnected: () {});
          break;
        case ResponseType.unknown:
          serviceStatus = ServiceStatus.failed;
          ErrorBottomSheet.unknownErr(context: context);
          break;
      }
    }
  }
}
