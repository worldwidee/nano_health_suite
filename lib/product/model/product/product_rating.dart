import 'package:json_annotation/json_annotation.dart';

part 'product_rating.g.dart';

@JsonSerializable()
class ProductRating {
  int? count;
  double? rate;
  ProductRating({this.count, this.rate});

  ProductRating fromJson(Map<String, dynamic> json) {
    return _$ProductRatingFromJson(json);
  }

  factory ProductRating.fromJson(Map<String, dynamic> json) {
    return _$ProductRatingFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$ProductRatingToJson(this);
  }
}
