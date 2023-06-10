// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';
import 'package:nano_health_suite/core/states/app_user/app_user.dart';
part 'profile_view_model.g.dart';

class ProfileViewModel = _ProfileViewModelBase with _$ProfileViewModel;

abstract class _ProfileViewModelBase with Store {
  Future<void> logout() async {
    await AppUser.instance.logout();
  }
}
