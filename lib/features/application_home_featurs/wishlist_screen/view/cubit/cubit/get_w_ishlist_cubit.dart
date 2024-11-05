import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/utilize/getcources_and_instracture/get_instracture_and_cources.dart';
import 'package:study_path/utilize/getdata_repos/getcources_repo/getcourse_repo.dart';

part 'get_w_ishlist_state.dart';

class GetWIshlistCubit extends Cubit<GetWIshlistState> {
  GetWIshlistCubit() : super(GetWIshlistInitial());

  getsishlist(UserModel model) async {
    try {
      emit(GetWIshlistLoading());
      Either<List<CourseAllDetails>, Handleerror> result;
      List<CourseAllDetails> listofresult = [];
      GetInstractureAndCources coursefich = GetInstractureAndCources();
      await Future.forEach(model.wishlist, (docs) async {
        result = await coursefich.getdata(
            getcources: GetCourcesWithdocs(),
            collection: 'cources',
            docs: docs);

        result.fold((left) {
          listofresult.add(left.first);
        }, (right) {});
      });

      emit(GetWIshlistSucces(listofresult));
    } catch (e) {
      emit(GetWIshlistFail(e.toString()));
    }
  }
}
