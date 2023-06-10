import 'package:nano_health_suite/product/init/enum/auth_path_enum.dart';
import '../../../core/init/network/project_network_manager.dart';

extension AuthPathExtensions on AuthPathEnum {
  String get _rawValue {
    switch (this) {
      case AuthPathEnum.login:
        return '/login';
    }
  }

  String get path {
    return '/auth$_rawValue';
  }

  String get fullPath {
    return '${ProjectNetworkManager.config.baseUrl}$path';
  }
}
