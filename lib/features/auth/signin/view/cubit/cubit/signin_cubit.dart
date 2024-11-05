import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/class/sharedpref/sharedpref_adddata.dart';
import 'package:study_path/utilize/createacount_repos/abstract_repo.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  bool closed = false;
  signin({required CreateAcount signinprovider}) async {
    try {
      if (signinprovider is! Createfacebookauth) {
        emit(SigninLoading());
      }

      Handleerror? result = await signinprovider.create();
      if (result == null) {
        emit(SigninSucces());
      } else {
        emit(SigninFail(result.eror!));
      }
    } catch (e) {
      emit(SigninFail(Handleerror.fromjson(e.toString()).eror!));
    }
  }

  signinwithemailandpass(
      {required String email, required String password}) async {
    try {
      emit(SigninLoading());

      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (!credential.user!.emailVerified) {
        credential.user!.sendEmailVerification();
        emit(SigninNotverify(
            "This account has not been verfiyed. Please check your email and then register"));
      } else {
        await AddToSharedPref.addstring(
            key: "uid", value: credential.user!.uid);
        // save user creintal in shared pref
        emit(SigninSucces());
      }
    } on FirebaseAuthException catch (e) {
      emit(SigninFail(Handleerror.fromjson(e.code).eror!));
    }
  }
}
