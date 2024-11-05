// import 'package:study_path/utilize/gineralmodels/video_model.dart';

// class CourseModel {
//   String? instractureid;
//   String? coverurl;

//   String? title;

//   String? category;
//   double? discount;
//   String? docsuid;
//   double? price;
//   DateTime? time;
//   int? priority;
//   List<ResourcesModel> articalelist = [];
//   List<ResourcesModel> bookslist = [];

//   Map<String, dynamic> json = {};
//   List<VideoModel> videos = [];
//   CourseModel.fromjson(Map<String, dynamic> json, this.docsuid) {
//     instractureid = json['instractureid'];

//     coverurl = json['coverurl'];

//     title = json['title'];

//     category = json['category'];

//     discount = json['discount'];
//     price = json['price'];
//     time = DateTime.fromMillisecondsSinceEpoch(json['time']);
//     priority = json['priority'];
//     json['book'].forEach((v) {
//       bookslist.add(ResourcesModel.fromjson(v));
//     });

//     json['book'].forEach((v) {
//       bookslist.add(ResourcesModel.fromjson(v));
//     });
//   }
// }

// class ResourcesModel {
//   String? title;
//   String? auther;
//   String? description;
//   ResourcesModel.fromjson(Map<String, dynamic> json) {
//     title = json['title'];
//     auther = json['auther'];
//     description = json['description'];
//   }
// }
