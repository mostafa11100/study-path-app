import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/body_of_links.dart';

class InstractureModel {
  String? name;
  String? bio;

  String? aboutme;
  String? photourl;
  String? email;
  String? uid;
  String? phone;
  Map<String, dynamic> json = {};
  List<Commint> commints = [];
  List<dynamic> coursesid = [];
  List<SocialMediamodel> links = [];
  SocialMediamodel? socialMediamodel;
  InstractureModel.fromjson({required Map<String, dynamic> json, this.uid}) {
    name = json['name'] ?? "";

    bio = json['bio'] ?? "";

    aboutme = json['aboutme'] ?? "";
    photourl = json['photourl'] ?? "";
    email = json['email'] ?? "";
    phone = json['phone'] ?? "";
    aboutme = json['aboutme'] ?? "";
    socialMediamodel = SocialMediamodel.fromjson(json['sociallinks']);
    json['reviewcommints'].forEach((com) {
      commints.add(Commint.fromjson(com));
    });
    coursesid = json['courcesuid'];
  }
  InstractureModel.tojson(
      {this.email,
      this.phone,
      this.photourl,
      this.uid,
      this.name,
      this.aboutme,
      this.bio}) {
    json['email'] = email;
    json['name'] = name;
    json['aboutme'] = aboutme;
    json['phone'] = phone;
    json['photourl'] = photourl;
    json['bio'] = bio;
  }
}

class Commint {
  String? commint;
  DateTime? time;
  String? uid;
  Commint.fromjson(Map<String, dynamic> json) {
    Timestamp timestamp = json['time'];
    commint = json['commint'] ?? "";
    uid = json['uid'] ?? '';
    time =
        DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
  }
}

class SocialMediamodel {
  List<TypeAndLink> listoflinks = [];
  SocialMediamodel.fromjson(Map<String, dynamic> json) {
    json.forEach((key, val) {
      switch (key) {
        case 'facebook':
          listoflinks.add(TypeAndLink(val, socialmediatype.FaceBook));
          break;
        case 'linkedin':
          listoflinks.add(TypeAndLink(val, socialmediatype.Linkedin));
          break;
        default:
          listoflinks.add(TypeAndLink(val, socialmediatype.Linkedin));
          break;
      }
    });
  }
}

class TypeAndLink {
  socialmediatype? type;
  String? link;
  TypeAndLink(this.link, this.type);
}
