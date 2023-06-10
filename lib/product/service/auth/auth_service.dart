import 'package:dio/dio.dart';
import 'package:nano_health_suite/product/init/enum/auth_path_enum.dart';
import 'package:nano_health_suite/product/init/extensions/auth_path_extensions.dart';
import 'package:nano_health_suite/product/model/login/login_response.dart';
import 'package:nano_health_suite/product/service/auth/auth_service_io.dart';
import 'package:vexana/vexana.dart';

import '../../model/error/project_error_model.dart';
import '../../model/login/login_parameter.dart';

class AuthService extends IAuthService {
  @override
  Future<IResponseModel<LoginResponse?, ProjectErrorModel?>> login(
      LoginParameter parameter) async {
    try {
      final dio = Dio();
      final response =
          await dio.post(AuthPathEnum.login.fullPath, data: parameter.toJson());
      return ResponseModel<LoginResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? LoginResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  model: ProjectErrorModel.nullData(),
                  statusCode: 200,
                  description: "")
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<LoginResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
                model: e.response!.data != null
                    ? ProjectErrorModel(
                        data: e.response!.data is String
                            ? e.response!.data
                            : null)
                    : null,
                statusCode: e.response!.statusCode,
                description: e.response!.statusMessage));
      } else {
        return ResponseModel<LoginResponse?, ProjectErrorModel?>(
            error: ErrorModel<ProjectErrorModel?>(
                model: ProjectErrorModel.noConnection(),
                statusCode: e.response?.statusCode,
                description: e.response?.statusMessage));
      }
    }
  }
}
