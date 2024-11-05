import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/utilize/createacount_repos/abstract_repo.dart';

part 'create_acount_state.dart';

class CreateAcountCubit extends Cubit<CreateAcountState> {
  CreateAcountCubit(this.createAcountprovider) : super(CreateAcountInitial());
  bool closed = false;
  CreateAcount createAcountprovider = CreateEmailAndPassowrd();
  create(
      {required String email,
      required String password,
      required UserModel model}) async {
    try {
      emit(CreateAcountLoading());
      Handleerror? result = await createAcountprovider.create(
          email: email, password: password, createuserdatamodel: model);

      if (result == null) {
        if (closed == false) {
          emit(CreateAcountSuccess());
        }
      } else {
        if (closed == false) {
          emit(CreateAcountFail(result.eror!));
        }
      }
    } catch (e) {
      if (closed == false) {
        CreateAcountFail(e.toString());
      }
    }
  }

  @override
  Future<void> close() {
    closed = true;
    return super.close();
  }
}
