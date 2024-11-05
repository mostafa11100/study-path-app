import 'package:firebase_core/firebase_core.dart';
import 'package:study_path/class/firebase/add_data.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';

class UpdateAcountdata {
  Future<Handleerror?> update(UserModel usermodel, uid) async {
    try {
      await FirestoreAddData.setdata(
          collection: "users", doc: uid, data: usermodel.json);
    } on FirebaseException catch (e) {
      return Handleerror.fromjson(e.code);
    } catch (e) {
      return Handleerror.fromjson(e.toString());
    }
    return null;
  }
}
