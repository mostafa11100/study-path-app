import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_path/class/firebase/add_data.dart';
import 'package:study_path/class/firebase/create_acount_infirebase.dart';
import 'package:study_path/class/firebase/verify/sendverify_email.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

abstract class CreateAcount {
  create(
      {String? email,
      String? password,
      CreateUserDataModel? createuserdatamodel});
}

class CreateEmailAndPassowrd extends CreateAcount {
  @override
  Future<Handleerror?> create(
      {String? email,
      String? password,
      CreateUserDataModel? createuserdatamodel}) async {
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
      {String? email,
      String? password,
      CreateUserDataModel? createuserdatamodel}) async {
    try {
      UserCredential? userCredential =
          await CreateAcountInfirebase.signInWithFacebook();
      if (userCredential != null) {
        CreateUserDataModel? model = CreateUserDataModel.tojson(
            email: userCredential.user!.email,
            name: userCredential.user!.displayName,
            photourl: userCredential.user!.photoURL,
            phone: userCredential.user!.phoneNumber);
        await FirestoreAddData.setdata(
            collection: "users",
            doc: userCredential.user!.uid,
            data: model.json);
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
      {String? email,
      String? password,
      CreateUserDataModel? createuserdatamodel}) async {
    Handleerror? eror;
    try {
      Either<UserCredential, Handleerror> userCredential =
          await CreateAcountInfirebase.signInWithGoogle();
      await userCredential.fold((left) async {
        CreateUserDataModel? model = CreateUserDataModel.tojson(
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
      {String? email,
      String? password,
      CreateUserDataModel? createuserdatamodel}) {
    throw UnimplementedError();
  }
}

class CreateUserDataModel {
  String? uid;

  String? name;
  String? lastname;
  String? email;
  String? photourl;
  String? phone;
  Map json = {};
  CreateUserDataModel.fromjson({required Map json}) {
    name = json['name'];
    lastname = json['lastname'];
    uid = json['uid'];
    email = json['email'];
    photourl = json["photourl"];
    phone = json["phone"];
  }

  CreateUserDataModel.tojson(
      {this.email,
      this.phone,
      this.photourl,
      this.uid,
      this.name,
      this.lastname}) {
    json['email'] = email;
    json['name'] = name;
    json['lastname'] = lastname;
    json['phone'] = phone;
    json['photourl'] = photourl;
    json['uid'] = uid;
  }
}
