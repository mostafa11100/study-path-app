import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/firebase/verify/sendverify_email.dart';
import 'package:study_path/class/handlerror/handleerror.dart';

part 'sendverify_state.dart';

class SendverifyCubit extends Cubit<SendverifyState> {
  SendverifyCubit() : super(SendverifyInitial());
  send({required String email}) async {
    //emit loading
    emit(SendverifyLoading());
    Handleerror? result = await SendverifyEmail.sendcodetoemail(email: email);
    if (result == null) {
      //emit succes
      emit(SendverifySucces());
    } else {
      //emit error}
      emit(SendverifyFail(result.eror!));
    }
  }
}
