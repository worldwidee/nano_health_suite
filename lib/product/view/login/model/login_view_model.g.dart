// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LoginViewModel on _LoginViewModelBase, Store {
  late final _$serviceStatusAtom =
      Atom(name: '_LoginViewModelBase.serviceStatus', context: context);

  @override
  ServiceStatus get serviceStatus {
    _$serviceStatusAtom.reportRead();
    return super.serviceStatus;
  }

  @override
  set serviceStatus(ServiceStatus value) {
    _$serviceStatusAtom.reportWrite(value, super.serviceStatus, () {
      super.serviceStatus = value;
    });
  }

  late final _$errorTextEmailAtom =
      Atom(name: '_LoginViewModelBase.errorTextEmail', context: context);

  @override
  String? get errorTextEmail {
    _$errorTextEmailAtom.reportRead();
    return super.errorTextEmail;
  }

  @override
  set errorTextEmail(String? value) {
    _$errorTextEmailAtom.reportWrite(value, super.errorTextEmail, () {
      super.errorTextEmail = value;
    });
  }

  late final _$obscureTextAtom =
      Atom(name: '_LoginViewModelBase.obscureText', context: context);

  @override
  bool get obscureText {
    _$obscureTextAtom.reportRead();
    return super.obscureText;
  }

  @override
  set obscureText(bool value) {
    _$obscureTextAtom.reportWrite(value, super.obscureText, () {
      super.obscureText = value;
    });
  }

  late final _$errorTextPasswordAtom =
      Atom(name: '_LoginViewModelBase.errorTextPassword', context: context);

  @override
  String? get errorTextPassword {
    _$errorTextPasswordAtom.reportRead();
    return super.errorTextPassword;
  }

  @override
  set errorTextPassword(String? value) {
    _$errorTextPasswordAtom.reportWrite(value, super.errorTextPassword, () {
      super.errorTextPassword = value;
    });
  }

  late final _$_LoginViewModelBaseActionController =
      ActionController(name: '_LoginViewModelBase', context: context);

  @override
  void updateObscureText() {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.updateObscureText');
    try {
      return super.updateObscureText();
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUsername(String value) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.validateUsername');
    try {
      return super.validateUsername(value);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_LoginViewModelBaseActionController.startAction(
        name: '_LoginViewModelBase.validatePassword');
    try {
      return super.validatePassword(value);
    } finally {
      _$_LoginViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
serviceStatus: ${serviceStatus},
errorTextEmail: ${errorTextEmail},
obscureText: ${obscureText},
errorTextPassword: ${errorTextPassword}
    ''';
  }
}
