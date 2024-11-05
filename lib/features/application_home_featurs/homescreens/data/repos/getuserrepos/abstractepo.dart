import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:study_path/class/firebase/getdatafromfirebase/getdatasimplequery.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/utilize/getdata_repos/getuser_repos/getuser_abstract.dart';

class GetUserFromFirebasee extends GetUserData {
  @override
  getuser({String? uid, collection}) async {
    Either<UserModel, Handleerror>? result;
    try {
      Either<DocumentSnapshot<Map<String, dynamic>>, Handleerror> data =
          await Getdatasimplequery.getdata(collection: collection, docs: uid);

      data.fold((left) {
        result = Left(UserModel.fromjson(json: left.data()!));
      }, (right) {
        result = Right(right);
      });
    } catch (e) {
      result = Right(Handleerror.fromjson(e.toString()));
    }
    return result;
  }
}
