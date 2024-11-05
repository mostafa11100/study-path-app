import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

class Getdatacomplexquery {
  static FirebaseFirestore? fire;
  static Future<Either<QuerySnapshot<Map<String, dynamic>>, Handleerror>>
      getdata({collection1, filter}) async {
    try {
      fire = FirebaseFirestore.instance;
      QuerySnapshot<Map<String, dynamic>> result =
          await fire!.collection(collection1).where(filter).get();

      return Left(result);
    } on FirebaseException catch (e) {
      return Right(Handleerror.fromjson(e.code));
    } catch (e) {
      return Right(Handleerror.fromjson(e.toString()));
    }
  }
}
