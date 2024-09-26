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
}
