import 'regex_constants.dart';

extension StringValidator on String {
  String? get isValidEmail {
    return RegExp(RegexConstants.emailRegex).hasMatch(this)
        ? null
        : "Email adress is not match.";
  }

  String? get isValidPassword {
    return RegExp(RegexConstants.passwordRegex).hasMatch(this)
        ? null
        : "The value has a minimum of six characters.";
  }

  String? get isValidUserName {
    return RegExp(RegexConstants.userNameRegex).hasMatch(this)
        ? null
        : "The value has a minimum of four characters.";
  }
}

extension NullStringValidator on String? {
  bool get isNotNullOrNoEmpty {
    return this != null && this!.isNotEmpty;
  }
}

extension NullListStringValidator on List<dynamic>? {
  bool get isNotNullOrEmpty {
    return this != null && this!.isNotEmpty;
  }
}
