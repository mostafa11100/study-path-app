import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

class CreateNewpassowrd {
  static Future<Handleerror?> create({code, password}) async {
    FirebaseAuth fire = FirebaseAuth.instance;
    try {
      await fire.confirmPasswordReset(code: code, newPassword: password);
    } on FirebaseAuthException catch (e) {
      return Handleerror.fromjson(e.code);
    } catch (e) {
      return Handleerror.fromjson(e.toString());
    }
    return null;
  }
}
