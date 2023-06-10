import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';
import 'product_rating.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends INetworkModel<ProductResponse> {
  String? title, category, description, image;
  int? id;
  double? price;
  ProductRating? rating;
  ProductResponse({
    this.id,
    this.title,
    this.price,
    this.category,
    this.description,
    this.image,
    this.rating,
  });

  @override
  ProductResponse fromJson(Map<String, dynamic> json) {
    return _$ProductResponseFromJson(json);
  }

  @override
  factory ProductResponse.fromJson(Map<String, dynamic> json) {
    return _$ProductResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$ProductResponseToJson(this);
  }
}
