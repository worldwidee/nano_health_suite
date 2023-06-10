// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'project_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProjectErrorModel _$ProjectErrorModelFromJson(Map<String, dynamic> json) =>
    ProjectErrorModel(
      data: json['data'] as String?,
    )..noConnection = json['noConnection'] as bool;

Map<String, dynamic> _$ProjectErrorModelToJson(ProjectErrorModel instance) =>
    <String, dynamic>{
      'noConnection': instance.noConnection,
      'data': instance.data,
    };
