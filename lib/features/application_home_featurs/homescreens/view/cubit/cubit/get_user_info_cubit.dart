import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/class/sharedpref/sharedprefgetdata.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/utilize/getdata_repos/getuser_repos/getuser_abstract.dart';

part 'get_user_info_state.dart';

class GetUserInfoCubit extends Cubit<GetUserInfoState> {
  GetUserInfoCubit(this.getUserData) : super(GetUserInfoInitial());
  GetUserData getUserData;
  bool closed = false;
  getdata() async {
    try {
      emit(GetUserInfoLoading());
      String? uid = await Sharedprefgetdata.getstring('uid');

      if (uid != null) {
        Either<UserModel, Handleerror>? result =
            await getUserData.getuser(uid: uid, collection: "users");
        result!.fold((left) {
          if (closed == false) {
            emit(GetUserInfoSuccess(left));
          }
        }, (right) {
          if (closed == false) {
            emit(GetUserInfoFail(right.eror!));
          }
        });
      } else {
        if (closed == false) {
          emit(GetUserInfoFail(Handleerror.fromjson("erroor").eror!));
        }
      }
    } catch (e) {
      print(e);

      emit(GetUserInfoFail(e.toString()!));
    }
  }

  @override
  Future<void> close() {
    closed = true;
    return super.close();
  }
}
