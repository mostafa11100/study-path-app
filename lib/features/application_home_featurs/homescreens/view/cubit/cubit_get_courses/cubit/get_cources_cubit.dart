import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/utilize/getcources_and_instracture/get_instracture_and_cources.dart';
import 'package:study_path/utilize/getdata_repos/getcources_repo/getcourse_repo.dart';

part 'get_cources_state.dart';

class GetCourcesCubit extends Cubit<GetCourcesState> {
  bool closed = false;
  GetCourcesCubit() : super(GetCourceInitial());
  getcources(Filter filter) async {
    try {
      GetInstractureAndCources getall = GetInstractureAndCources();

      Either<List<CourseAllDetails>, Handleerror> result = await getall.getdata(
          getcources: GetCourcesWithPrametr(), filter: filter);

      result.fold((left) {
        //  if (closed) {
        emit(GetCourcesSucces(left));
        //}
      }, (right) {
        //if (closed) {
        emit(GetCourcesFail(right.eror!));
        //}
      });
    } catch (e) {
      if (!closed) {
        emit(GetCourcesFail(e.toString()));
      }
    }
  }

  @override
  Future<void> close() {
    closed = true;
    return super.close();
  }
}
