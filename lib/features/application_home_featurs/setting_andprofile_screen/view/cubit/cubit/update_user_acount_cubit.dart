import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/class/sharedpref/sharedprefgetdata.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/data/repos/update_acountdata.dart';

part 'update_user_acount_state.dart';

class UpdateUserAcountCubit extends Cubit<UpdateUserAcountState> {
  UpdateUserAcountCubit() : super(UpdateUserAcountInitial());
  updateuser(UserModel usermodel) async {
    String? uid = await Sharedprefgetdata.getstring('uid');
    emit(UpdateUserAcountLoading());
    UpdateAcountdata repoupdate = UpdateAcountdata();
    Handleerror? result = await repoupdate.update(usermodel, uid);
    if (result == null) {
      //emit succes
      emit(UpdateUserAcountSucces());
    } else {
      emit(UpdateUserAcountFail(result));
      //emit fail
    }
  }
}
