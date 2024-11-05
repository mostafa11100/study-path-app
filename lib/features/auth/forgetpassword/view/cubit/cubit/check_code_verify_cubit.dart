import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/firebase/check_verify_code/check_code.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

part 'check_code_verify_state.dart';

class CheckCodeVerifyCubit extends Cubit<CheckCodeVerifyState> {
  CheckCodeVerifyCubit() : super(CheckCodeVerifyInitial());
  checkcode(String code) async {
    emit(CheckCodeVerifyLoading());
    Handleerror? error = await CheckCodeVerify.check(code);
    if (error == null) {
      emit(CheckCodeVerifySucces());
    } else {
      emit(CheckCodeVerifyFail(error.eror!));
    }
  }
}
