import 'package:cloud_firestore/cloud_firestore.dart';

class VideoModel {
  String? title;
  String? coverurl;
  String? url;
  Map<String, dynamic> json = {};
  VideoModel.fromjson(Map<String, dynamic> json) {
    title = json['title'] ?? "";
    coverurl = json['coverurl'] ?? "";
    url = json['url'] ?? "";

    // print('pefore video gettime ');
    // Timestamp timestamp = json['time'];

    // print(' after video gettime ${json['time']}');
    // time =
    //     DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch);
  }

  VideoModel.tojson({this.title, this.coverurl, this.url}) {
    json['title'] = title;
    json['coverurl'] = coverurl;

    json['url'] = url;
  }
}
