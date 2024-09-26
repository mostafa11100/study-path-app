import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

class FirestoreAddData {
  static FirebaseFirestore? firestore;
  static Future<Handleerror?> setdata({collection, doc, data}) async {
    try {
      await firestore!
          .collection(collection)
          .doc(doc)
          .set(data, SetOptions(merge: true));
    } catch (e) {
      return Handleerror.fromjson(e.toString());
    }
    return null;
  }
}
