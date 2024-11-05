import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/firebase/add_data.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/class/sharedpref/sharedprefgetdata.dart';

part 'add_to_wishlist_state.dart';

class AddToWishlistCubit extends Cubit<AddToWishlistState> {
  AddToWishlistCubit() : super(AddToWishlistInitial());
  add(docs) async {
    try {
      print("successsssssssssssss ennntteerr");
      String? uid = await Sharedprefgetdata.getstring('uid');
      print("successsssssssssssss after uid $uid");
      Handleerror? result = await FirestoreAddData.updatedatapfarray(
          collection: "user", doc: uid, data: docs, feild: 'wishlist');

      if (result == null) {
        print("successsssssssssssss");
        emit(AddToWishlistSucces());
      } else {
        print("successsssssssssssss errror ${result.eror} ");
        emit(AddToWishlistFail(result.eror!));
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
