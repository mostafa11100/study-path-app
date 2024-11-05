import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_path/class/firebase/add_data.dart';
import 'package:study_path/class/firebase/create_acount_infirebase.dart';
import 'package:study_path/class/firebase/verify/sendverify_email.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/class/sharedpref/sharedpref_adddata.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';

abstract class CreateAcount {
  create({String? email, String? password, UserModel? createuserdatamodel});
}

class CreateEmailAndPassowrd extends CreateAcount {
  @override
  Future<Handleerror?> create(
      {String? email, String? password, UserModel? createuserdatamodel}) async {
    Handleerror? eror;
    Either<UserCredential, Handleerror> createruslt =
        await CreateAcountInfirebase.createmailandpass(
            email: email!, password: password!);
    await createruslt.fold((left) async {
      Handleerror? result = await FirestoreAddData.setdata(
          collection: "users",
          doc: left.user!.uid,
          data: createuserdatamodel!.json);
      if (result == null) {
        Handleerror? verifysended = await SendverifyEmail.sendverify();
        eror = verifysended;
      } else {
        eror = result;
      }
    }, (right) {
      eror = right;
    });

    return eror;
  }
}

class Createfacebookauth extends CreateAcount {
  @override
  Future<Handleerror?> create(
      {String? email, String? password, UserModel? createuserdatamodel}) async {
    try {
      UserCredential? userCredential =
          await CreateAcountInfirebase.signInWithFacebook();
      if (userCredential != null) {
        UserModel? model = UserModel.tojson(
            email: userCredential.user!.email,
            name: userCredential.user!.displayName,
            photourl: null,
            phone: userCredential.user!.phoneNumber);
        await FirestoreAddData.setdata(
            collection: "users",
            doc: userCredential.user!.uid,
            data: model.json);
        await AddToSharedPref.addstring(
            key: 'uid', value: userCredential.user!.uid);
      } else {
        return Handleerror.fromjson("can't sign in try another acount");
      }
    } catch (e) {
      return Handleerror.fromjson(e.toString());
    }
    return null;
  }
}

class Creategoogleauth extends CreateAcount {
  @override
  Future<Handleerror?> create(
      {String? email, String? password, UserModel? createuserdatamodel}) async {
    Handleerror? eror;
    try {
      Either<UserCredential, Handleerror> userCredential =
          await CreateAcountInfirebase.signInWithGoogle();
      await userCredential.fold((left) async {
        UserModel? model = UserModel.tojson(
            email: left.user!.email,
            name: left.user!.displayName,
            photourl: left.user!.photoURL,
            phone: left.user!.phoneNumber);
        await FirestoreAddData.setdata(
            collection: "users", doc: left.user!.uid, data: model.json);
      }, (right) {
        eror = right;
      });
    } catch (e) {
      eror = Handleerror.fromjson(e.toString());
    }
    return eror;
  }
}

class Createtwitterauth extends CreateAcount {
  @override
  Either<UserCredential, Handleerror> create(
      {String? email, String? password, UserModel? createuserdatamodel}) {
    throw UnimplementedError();
  }
}
