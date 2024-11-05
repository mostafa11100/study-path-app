import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:study_path/class/firebase/getdatafromfirebase/getdata_complexquery.dart';
import 'package:study_path/class/firebase/getdatafromfirebase/getdatasimplequery.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/utilize/getdata_repos/getcources_repo/abstract_getcources.dart';

class GetCourcesWithPrametr extends GetCources {
  @override
  Future<Either<List<CourseModel>, Handleerror>?> getcources(
      {filter, collection, docs}) async {
    List<CourseModel> listofcourseModel = [];

    Either<List<CourseModel>, Handleerror>? result;
    try {
      Either<QuerySnapshot<Map<String, dynamic>>, Handleerror> data =
          await Getdatacomplexquery.getdata(
              collection1: "cources", filter: filter);
      data.fold((left) {
        for (QueryDocumentSnapshot docs in left.docs) {
          docs.data();
          listofcourseModel.add(CourseModel.fromjson(
              docs.data() as Map<String, dynamic>, docs.id));
        }

        result = Left(listofcourseModel);
      }, (right) {
        result = Right(right);
      });
    } catch (e) {
      result = Right(Handleerror.fromjson(e.toString()));
    }
    return result;
  }
}

class GetCourcesWithdocs extends GetCources {
  @override
  Future<Either<List<CourseModel>, Handleerror>?> getcources(
      {filter, collection, docs}) async {
    List<CourseModel> listofcourseModel = [];
    print(docs);
    Either<List<CourseModel>, Handleerror>? result;
    try {
      Either<DocumentSnapshot<Map<String, dynamic>>, Handleerror> data =
          await Getdatasimplequery.getdata(collection: collection, docs: docs);
      // await Getdatacomplexquery.getdata(
      //     collection1: "cources", filter: filter);
      data.fold((left) {
        print("left =l=l=${left.data()}");
        listofcourseModel.add(CourseModel.fromjson(left.data()!, left.id));
        result = Left(listofcourseModel);
      }, (right) {
        result = Right(right);
      });
    } catch (e) {
      result = Right(Handleerror.fromjson(e.toString()));
    }
    return result;
  }
}
