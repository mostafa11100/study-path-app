import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? name;
  String? lastname;
  String? bio;
  String? photourl;
  String? email;
  String? uid;
  String? phone;
  String? password;
  String? language;
  DateTime? dateTime;
  bool? notfication;
  List<dynamic> wishlist = [];

  List<Mycourcesmodel>? mycources = [];
  Map<String, dynamic> json = {};
  UserModel.fromjson({required Map<String, dynamic> json, this.uid}) {
    name = json['name'] ?? "";
    lastname = json['lastname'] ?? "";
    bio = json['bio'] ?? "";
    photourl = json['photourl'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    password = json['password'] ?? "";
    wishlist = json['wishlist'];
    language = json['language'] ?? 'en';

    Timestamp t = json['birth'] ?? Timestamp.now();

    dateTime = DateTime.fromMillisecondsSinceEpoch(t.millisecondsSinceEpoch);
    notfication = json['notfication'] ?? true;
    json['mycources']?.forEach((v) {
      mycources!.add(Mycourcesmodel.fromjson(v));
    });
  }
  List<Map<String, dynamic>> listcourcesjson = [];
  UserModel.tojson(
      {this.email,
      this.phone,
      this.photourl,
      this.uid,
      this.name,
      this.lastname,
      this.bio,
      this.mycources,
      this.password,
      this.dateTime,
      this.language}) {
    email != null ? json['email'] = email : null;
    password != null ? json['password'] = password : null;
    name != null ? json['name'] = name : null;
    lastname != null ? json['lastname'] = lastname : null;
    phone != null ? json['phone'] = phone : null;
    photourl != null ? json['photourl'] = photourl : null;
    bio != null ? json['bio'] = bio : null;
    dateTime != null ? json['birth'] = Timestamp.fromDate(dateTime!) : null;
    print("fetchuserdone  ");
    //   mycources?.forEach((e) {
    //     listcourcesjson.add(e.json);
    //   });
    //   json['mycources'] = listcourcesjson;
  }
}

class Mycourcesmodel {
  String? uid;
  int? complete;
  Map<String, dynamic> json = {};
  Mycourcesmodel.fromjson(Map<String, dynamic> json) {
    uid = json['uid'] ?? "";
    complete = json['complete'] ?? 5;
  }
  Mycourcesmodel.tojson({this.complete, this.uid}) {
    json['complete'] = complete;
    json['uid'] = uid;
  }
}
