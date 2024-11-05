import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

class UpdateAuthAcountdata {
  Future<Handleerror?> update(password) async {
    User? user = FirebaseAuth.instance.currentUser;

    //  await user?.verifyBeforeUpdateEmail(newEmail);

    try {
      await user?.updatePassword(password);
    } on FirebaseException catch (e) {
      return Handleerror.fromjson(e.code);
    } catch (e) {
      return Handleerror.fromjson(e.toString());
    }
    return null;
  }
}
