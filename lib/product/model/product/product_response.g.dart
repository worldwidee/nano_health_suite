// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      category: json['category'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      rating: json['rating'] == null
          ? null
          : ProductRating.fromJson(json['rating'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'title': instance.title,
      'category': instance.category,
      'description': instance.description,
      'image': instance.image,
      'id': instance.id,
      'price': instance.price,
      'rating': instance.rating,
    };
