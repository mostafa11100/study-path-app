import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

class CheckCodeVerify {
  static Future<Handleerror?> check(String code) async {
    try {
      FirebaseAuth fire = FirebaseAuth.instance;
      await fire.verifyPasswordResetCode(code);
      return null;
    } on FirebaseAuthException catch (e) {
      return Handleerror.fromjson(e.code);
    } catch (e) {
      return Handleerror.fromjson(e.toString());
    }
  }
}
