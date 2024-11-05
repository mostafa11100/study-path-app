// ignore: implementation_imports
import 'package:either_dart/src/either.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/data/models/instracturemodel.dart';
import 'package:study_path/utilize/getdata_repos/getcources_repo/abstract_getcources.dart';
import 'package:study_path/utilize/getdata_repos/getuser_repos/get_instracture.dart';

class GetInstractureAndCources {
  Future<Either<List<CourseAllDetails>, Handleerror>> getdata(
      {required GetCources getcources, filter, collection, docs}) async {
    Either<List<CourseAllDetails>, Handleerror>? finish;
    try {
      GetuserFromFirebasee instracturefetch = GetuserFromFirebasee();
      List<CourseAllDetails> listofadlldetails = [];
      Either<List<CourseModel>, Handleerror>? cources = await getcources
          .getcources(filter: filter, collection: collection, docs: docs);

      await cources!.fold((left) async {
        print("enter to left name== ${left.first.title} ==${left.length}");
        await Future.sync(() async {
          for (var course in left) {
            Either<InstractureModel, Handleerror>? result =
                await instracturefetch.getuser(
                    uid: course.instractureid, collection: "instracture");

            result!.fold((left) {
              print("enter22 to left name== ${left.name} ");
              listofadlldetails.add(CourseAllDetails(
                  courseModel: course, instractureModel: left));
            }, (right) {
              finish = Right(right);
              print("enter3 error to left name== ${right.eror}");
            });
          }
        });
        finish = Left(listofadlldetails);
      }, (right) {
        finish = Right(right);
      });
    } catch (e) {
      finish = Right(Handleerror.fromjson(e.toString()));
    }
// GetUserData

    return finish!;
  }
}

class CourseAllDetails {
  CourseModel? courseModel;
  InstractureModel? instractureModel;
  CourseAllDetails({this.courseModel, this.instractureModel});
}
