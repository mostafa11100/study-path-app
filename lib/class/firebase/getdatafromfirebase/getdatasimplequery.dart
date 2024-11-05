import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

class Getdatasimplequery {
  static FirebaseFirestore? fire;
  static Future<Either<DocumentSnapshot<Map<String, dynamic>>, Handleerror>>
      getdata({collection, docs}) async {
    try {
      fire = FirebaseFirestore.instance;
      DocumentSnapshot<Map<String, dynamic>> result =
          await fire!.collection(collection).doc(docs).get();

      return Left(result);
    } on FirebaseException catch (e) {
      return Right(Handleerror.fromjson(e.code));
    } catch (e) {
      return Right(Handleerror.fromjson(e.toString()));
    }
  }
}
