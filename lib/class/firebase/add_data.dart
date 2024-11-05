import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

class FirestoreAddData {
  static FirebaseFirestore? firestore;
  static Future<Handleerror?> setdata({collection, doc, data}) async {
    try {
      firestore = FirebaseFirestore.instance;
      await firestore!
          .collection(collection)
          .doc(doc)
          .set(data, SetOptions(merge: true));
    } catch (e) {
      return Handleerror.fromjson(e.toString());
    }

    return null;
  }

  static Future<Handleerror?> updatedatapfarray(
      {collection, doc, data, feild}) async {
    try {
      firestore = FirebaseFirestore.instance;

      firestore!.collection(collection).doc(doc).update({
        feild: FieldValue.arrayUnion([data]),
      });
    } catch (e) {
      return Handleerror.fromjson(e.toString());
    }

    return null;
  }
}
