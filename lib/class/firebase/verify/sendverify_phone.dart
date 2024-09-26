import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

class SendverifyPhone {
  static Future<Either<String, Handleerror>?> send(
      {required String phone}) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    try {
      Either<String, Handleerror>? result;
      String? code;
      auth.verifyPasswordResetCode(code!);
      await auth.verifyPhoneNumber(
        phoneNumber: phone,
        codeSent: (String verificationId, int? resendToken) async {
          // Update the UI - wait for the user to enter the SMS code

          result = Left(verificationId);

          // Create a PhoneAuthCredential with the code
          // PhoneAuthCredential credential = PhoneAuthProvider.credential(
          //     verificationId: verificationId, smsCode: smsCode);

          // // Sign the user in (or link) with the credential
          // await auth.signInWithCredential(credential);
        },
        verificationCompleted: (PhoneAuthCredential phoneAuthCredential) {},
        verificationFailed: (FirebaseAuthException error) {
          result = Right(Handleerror.fromjson(error.code));
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
      return result;
    } catch (e) {
      return Right(Handleerror.fromjson(e.toString()));
    }
  }
}
