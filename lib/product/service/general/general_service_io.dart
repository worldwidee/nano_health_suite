import 'package:vexana/vexana.dart';

import '../../model/error/project_error_model.dart';
import '../../model/product/product_response.dart';
import '../../model/products/products_response.dart';

abstract class IGeneralService {
  Future<IResponseModel<ProductsResponse?, INetworkModel<ProjectErrorModel>?>>
      getProducts();
  Future<IResponseModel<ProductResponse?, INetworkModel<ProjectErrorModel>?>>
      getProduct(String id);
}
