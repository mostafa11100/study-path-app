// ignore_for_file: camel_case_types

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_path/utilize/gineralmodels/video_model.dart';

class CourseModel {
  String? instractureid;
  String? coverurl;

  String? title;

  List<dynamic>? tasks = [];

  String? category;
  int? discount;
  String? docsuid;
  int? price;
  int? time;
  int? priority;
  Map<String, dynamic>? json = {};
  List<VideoModel>? videos = [];
  List<resourcesleModel> listofarticles = [];

  List<int> listofarrticles = [];

  List<resourcesleModel> listofbooks = [];
  CourseModel.fromjson(Map<String, dynamic> json, this.docsuid) {
    instractureid = json['instractureid'] ?? "";

    coverurl = json['coverurl'] ?? "";

    title = json['title'] ?? "";

    category = json['category'] ?? "";

    discount = json['discount'] ?? 200;

    price = json['price'] ?? 300;

    tasks = json['tasks'] ?? [];
    if (json['articles'] != null) {
      json['articles'].forEach((article) {
        listofarticles.add(resourcesleModel.fromjson(article));
      });
    }
    if (json['book'] != null) {
      json['book'].forEach((book) {
        listofbooks.add(resourcesleModel.fromjson(book));
      });
    }
    if (json['videos'] != null) {
      json['videos'].forEach((video) {
        videos!.add(VideoModel.fromjson(video));
      });
    }

    time = json['time'] ?? 20;
    priority = json['priority'] ?? 10;
  }
}

class resourcesleModel {
  String? description;
  String? nameauther;
  String? title;

  resourcesleModel.fromjson(Map<String, dynamic> json) {
    description = json['description'] ?? "";
    nameauther = json['nameauther'] ?? "";
    title = json['title'] ?? "";
  }
}
