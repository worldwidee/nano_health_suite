import 'package:nano_health_suite/product/model/login/login_parameter.dart';
import 'package:vexana/vexana.dart';

import '../../model/error/project_error_model.dart';
import '../../model/login/login_response.dart';

abstract class IAuthService {
  Future<IResponseModel<LoginResponse?, INetworkModel<ProjectErrorModel>?>>
      login(LoginParameter parameter);
}
