import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

class SendverifyEmail {
  static Future<Handleerror?> sendverify() async {
    try {
      User? user;
      user = FirebaseAuth.instance.currentUser;
      await user?.sendEmailVerification();
    } catch (e) {
      return Handleerror.fromjson(e.toString());
    }
    return null;
  }

  static Future<Handleerror?> sendcodetoemail({required String email}) async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      return Handleerror.fromjson(e.code);
    } catch (e) {
      return Handleerror.fromjson(e.toString());
    }
    return null;
  }
}
