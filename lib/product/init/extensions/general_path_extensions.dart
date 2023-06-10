import '../../../core/init/network/project_network_manager.dart';
import '../enum/general_path_enum.dart';

extension GeneralPathExtensions on GeneralPathEnum {
  String get _rawValue {
    switch (this) {
      case GeneralPathEnum.products:
        return '/products';
    }
  }

  String get path {
    return _rawValue;
  }

  String get fullPath {
    return '${ProjectNetworkManager.config.baseUrl}$_rawValue';
  }
}
