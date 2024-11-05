import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/firebase/change_password/create_newpassowrd.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

part 'create_new_password_state.dart';

class CreateNewPasswordCubit extends Cubit<CreateNewPasswordState> {
  CreateNewPasswordCubit() : super(CreateNewPasswordInitial());
  create({String? code, required String newpassword}) async {
    emit(CreateNewPasswordLoading());
    Handleerror? result =
        await CreateNewpassowrd.create(code: code, password: newpassword);
    if (result == null) {
      emit(CreateNewPasswordSuccess());
    } else {
      emit(CreateNewPasswordFail(result.eror!));
    }
  }
}
