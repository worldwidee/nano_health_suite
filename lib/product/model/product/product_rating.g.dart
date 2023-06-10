// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_rating.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductRating _$ProductRatingFromJson(Map<String, dynamic> json) =>
    ProductRating(
      count: json['count'] as int?,
      rate: (json['rate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProductRatingToJson(ProductRating instance) =>
    <String, dynamic>{
      'count': instance.count,
      'rate': instance.rate,
    };
