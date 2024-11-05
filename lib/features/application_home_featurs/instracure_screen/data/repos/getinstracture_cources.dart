import 'package:either_dart/either.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/repos/getuserrepos/abstractepo.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/data/models/instracturemodel.dart';
import 'package:study_path/utilize/getdata_repos/getcources_repo/getcourse_repo.dart';
import 'package:study_path/utilize/getdata_repos/getuser_repos/getuser_abstract.dart';

class GetinstractureCources {
  GetUserData userData;
  GetinstractureCources({required this.userData});

  Future<Either<Instracturecourcesmodel, Handleerror>?> getdata(
      {required String instractureid}) async {
    GetCourcesWithdocs getCourcesWithdocs = GetCourcesWithdocs();
    List<CourseModel> cources = [];
    List<Reviewmodel> listofreview = [];
    Either<Instracturecourcesmodel, Handleerror>? endresult;
    try {
      InstractureModel? instractureModel;
      Either<InstractureModel, Handleerror>? result =
          await userData.getuser(uid: instractureid, collection: 'instracture');
      await result!.fold((left) async {
        userData = GetUserFromFirebasee();
        instractureModel = left;
        await Future.forEach(left.commints, (val) async {
          Either<UserModel, Handleerror>? user =
              await userData.getuser(collection: 'users', uid: val.uid);

          user!.fold((left2) {
            listofreview.add(Reviewmodel(left2, val));
            //add user
          }, (right) {
            endresult = Right(right);
          });
        });
        await Future.forEach(left.coursesid, (val) async {
          Either<List<CourseModel>, Handleerror>? course =
              await getCourcesWithdocs.getcources(
                  collection: 'cources', docs: val);
          course!.fold((left) {
            cources.add(left.first);
          }, (right) {
            endresult = Right(right);
          });
        });
        endresult = Left(
            Instracturecourcesmodel(cources, instractureModel, listofreview));
      }, (right) {
        endresult = Right(right);
      });
    } catch (e) {
      endresult = Right(Handleerror.fromjson(e.toString()));
    }

    return endresult;
  }
}

class Instracturecourcesmodel {
  List<Reviewmodel> reviewmodel = [];

  InstractureModel? instractureModel;
  List<CourseModel>? courseModel = [];
  Instracturecourcesmodel(
      this.courseModel, this.instractureModel, this.reviewmodel);
}

class Reviewmodel {
  UserModel user;
  Commint commint;
  Reviewmodel(this.user, this.commint);
}
