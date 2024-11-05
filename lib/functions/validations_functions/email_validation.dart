import 'package:email_validator/email_validator.dart';
import 'package:study_path/functions/validations_functions/validate_mopile.dart';

String? emailvalidation(String? email) {
  bool valid = EmailValidator.validate(email!);
  if (!valid) {
    if (validateMobile(email) != null) {
      return "Please enter a valid email address or  phone number";
    } else {
      return "phone";
    }
  } else {
    return null;
    // return "email";
  }
}
