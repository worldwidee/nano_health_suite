import 'package:json_annotation/json_annotation.dart';

part 'login_parameter.g.dart';

@JsonSerializable()
class LoginParameter {
  String? username, password;
  LoginParameter({this.username, this.password});

  LoginParameter fromJson(Map<String, dynamic> json) {
    return _$LoginParameterFromJson(json);
  }

  factory LoginParameter.fromJson(Map<String, dynamic> json) {
    return _$LoginParameterFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$LoginParameterToJson(this);
  }
}
