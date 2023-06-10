import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'login_response.g.dart';

@JsonSerializable()
class LoginResponse extends INetworkModel<LoginResponse> {
  String? token;
  LoginResponse({this.token});

  @override
  LoginResponse fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  factory LoginResponse.fromJson(Map<String, dynamic> json) {
    return _$LoginResponseFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() {
    return _$LoginResponseToJson(this);
  }
}
