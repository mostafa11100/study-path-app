import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/data/repos/getinstracture_cources.dart';
import 'package:study_path/utilize/getdata_repos/getuser_repos/get_instracture.dart';

part 'getinstracture_state.dart';

class GetinstractureCubit extends Cubit<GetinstractureState> {
  GetinstractureCubit() : super(Getinstractureloading());
  GetinstractureCources? getinstractureCources;
  fetchinstracture({required String uid}) async {
    getinstractureCources =
        GetinstractureCources(userData: GetuserFromFirebasee());

    Either<Instracturecourcesmodel, Handleerror>? result =
        await getinstractureCources!.getdata(instractureid: uid);
    result!.fold((left) {
      emit(Getinstracturesucces(left)); //sicces
    }, (right) {
      emit(Getinstracturefail(right.eror!)); //fail
    });
  }
}
