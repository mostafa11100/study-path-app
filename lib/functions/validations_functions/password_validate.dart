// ignore: non_constant_identifier_names
String? PasswordValidate(String? value) {
  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regExp = new RegExp(pattern);
  if (regExp.hasMatch(value!)) {
    return null;
  } else {
    return '''
    8 characters length
    2 letters in upper case
    1 special character (!@#\$&*)
    2 numerals (0-9)
    3 letters in lower case''';
  }
}
