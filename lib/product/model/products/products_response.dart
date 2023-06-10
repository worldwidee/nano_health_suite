import 'package:json_annotation/json_annotation.dart';
import 'package:nano_health_suite/product/model/product/product_response.dart';
import 'package:vexana/vexana.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse extends INetworkModel<ProductsResponse> {
  List<ProductResponse>? products;
  ProductsResponse({this.products});

  @override
  ProductsResponse fromJson(Map<String, dynamic> json) {
    return _$ProductsResponseFromJson(json);
  }

  ProductsResponse fromList(List<Map<String, dynamic>> list) {
    return ProductsResponse(
        products: list.map((e) => ProductResponse.fromJson(e)).toList());
  }

  factory ProductsResponse.fromJson(List<Map<String, dynamic>> list) {
    return ProductsResponse(
        products: list.map((e) => ProductResponse.fromJson(e)).toList());
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ProductsResponseToJson(this);
  }
}
