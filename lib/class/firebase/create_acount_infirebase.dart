import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

class CreateAcountInfirebase {
  static Future<Either<UserCredential, Handleerror>> createmailandpass(
      {required String email, required String password}) async {
    try {
      UserCredential firebaseAuth = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      return Left(firebaseAuth);
    } on FirebaseAuthException catch (e) {
      return Right(Handleerror.fromjson(e.code));
    } catch (e) {
      return Right(Handleerror.fromjson(e.toString()));
    }
  }

  static Future<Either<UserCredential, Handleerror>> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      return Left(userCredential);
    } on FirebaseAuthException catch (e) {
      return Right(Handleerror(e.code));
    } catch (e) {
      return Right(Handleerror(e.toString()));
    }
  }

  static Future<UserCredential?> signInWithFacebook() async {
    final LoginResult result = await FacebookAuth.instance.login();
    if (result.status == LoginStatus.success) {
      // Create a credential from the access token
      final OAuthCredential credential =
          FacebookAuthProvider.credential(result.accessToken!.tokenString);
      // Once signed in, return the UserCredential
      return await FirebaseAuth.instance.signInWithCredential(credential);
    }
    return null;
  }
}
