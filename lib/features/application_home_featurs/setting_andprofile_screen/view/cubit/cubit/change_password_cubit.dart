import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/data/repos/update_auth_acountdata.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial());
  changepassword(oldpassword, newpassword) async {
    UpdateAuthAcountdata change = UpdateAuthAcountdata();
    emit(ChangePasswordLoading());
    //check if oldpassword true
    Handleerror? result = await change.update(newpassword);
    if (result == null) {
      emit(ChangePasswordSucces());
    } else {
      emit(ChangePasswordFail(result));
    }
  }
}
