import 'package:dio/dio.dart';
import 'package:nano_health_suite/product/init/enum/general_path_enum.dart';
import 'package:nano_health_suite/product/init/extensions/general_path_extensions.dart';
import 'package:vexana/vexana.dart';

import '../../model/error/project_error_model.dart';
import '../../model/product/product_response.dart';
import '../../model/products/products_response.dart';
import 'general_service_io.dart';

class GeneralService extends IGeneralService {
  @override
  Future<IResponseModel<ProductsResponse?, ProjectErrorModel?>>
      getProducts() async {
    try {
      final dio = Dio();
      final response = await dio.get(GeneralPathEnum.products.fullPath);

      return ResponseModel<ProductsResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? ProductsResponse.fromJson(
                  List<Map<String, dynamic>>.from(response.data))
              : null,
          error: response.data == null
              ? ErrorModel(
                  model: ProjectErrorModel.nullData(),
                  statusCode: 200,
                  description: "")
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<ProductsResponse?, ProjectErrorModel?>(
            error: ErrorModel(
                model: e.response!.data != null
                    ? ProjectErrorModel(
                        data: e.response!.data is String
                            ? e.response!.data
                            : null)
                    : null,
                statusCode: e.response!.statusCode,
                description: e.response!.statusMessage));
      } else {
        return ResponseModel<ProductsResponse?, ProjectErrorModel?>(
            error: ErrorModel(
                model: ProjectErrorModel.noConnection(),
                statusCode: e.response?.statusCode,
                description: e.response?.statusMessage));
      }
    }
  }

  @override
  Future<IResponseModel<ProductResponse?, ProjectErrorModel?>> getProduct(
      String id) async {
    try {
      final dio = Dio();
      final response =
          await dio.get("${GeneralPathEnum.products.fullPath}/$id");

      return ResponseModel<ProductResponse?, ProjectErrorModel?>(
          data: response.data != null
              ? ProductResponse.fromJson(response.data)
              : null,
          error: response.data == null
              ? ErrorModel(
                  model: ProjectErrorModel.nullData(),
                  statusCode: 200,
                  description: "")
              : null);
    } on DioException catch (e) {
      if (e.response != null) {
        return ResponseModel<ProductResponse?, ProjectErrorModel?>(
            error: ErrorModel(
                model: e.response!.data != null
                    ? ProjectErrorModel(
                        data: e.response!.data is String
                            ? e.response!.data
                            : null)
                    : null,
                statusCode: e.response!.statusCode,
                description: e.response!.statusMessage));
      } else {
        return ResponseModel<ProductResponse?, ProjectErrorModel?>(
            error: ErrorModel(
                model: ProjectErrorModel.noConnection(),
                statusCode: e.response?.statusCode,
                description: e.response?.statusMessage));
      }
    }
  }
}
