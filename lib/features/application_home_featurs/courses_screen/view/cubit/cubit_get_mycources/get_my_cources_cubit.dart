import 'package:bloc/bloc.dart';
import 'package:either_dart/either.dart';
import 'package:meta/meta.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/utilize/getcources_and_instracture/get_instracture_and_cources.dart';
import 'package:study_path/utilize/getdata_repos/getcources_repo/getcourse_repo.dart';
part 'get_my_cources_state.dart';

class GetMyCourcesCubit extends Cubit<GetMyCourcesState> {
  GetMyCourcesCubit() : super(GetMyCourcesInitial());
  bool closed = false;
  getcources({required UserModel user}) async {
    print("udududududddd==${user.uid}");
    emit(GetMyCourcesLoading());
    Either<List<MyCourcesModeldetails>, Handleerror> result =
        await fetchmycourcesscreendata(
            mycources: user.mycources, uid: "4DjmMqYA7vbz5MRjei2nPBB7hl32");
    result.fold((left) {
      if (!closed) {
        emit(GetMyCourcesSuccess(left));
      }
    }, (right) {
      if (!closed) {
        emit(GetMyCourcesFail(right.eror!));
      }
    });
  }

  @override
  Future<void> close() {
    closed = true;
    return super.close();
  }
}

class MyCourcesModeldetails {
  CourseAllDetails? courseAllDetails;
  Mycourcesmodel? coursedata;
  MyCourcesModeldetails(this.courseAllDetails, this.coursedata);
}

Future<Either<List<MyCourcesModeldetails>, Handleerror>>
    fetchmycourcesscreendata(
        {required List<Mycourcesmodel>? mycources, uid}) async {
  GetInstractureAndCources getcourcesbyid = GetInstractureAndCources();
  Either<List<MyCourcesModeldetails>, Handleerror> resultfinish;
  List<MyCourcesModeldetails> listofdetilsmodel = [];

  try {
    // print("uiddd==${uid}");
    await Future.forEach(mycources!, (val) async {
      Either<List<CourseAllDetails>, Handleerror> reslt =
          await getcourcesbyid.getdata(
              getcources: GetCourcesWithdocs(),
              collection: "cources",
              docs: val.uid);
      reslt.fold((left) {
        print("get courcessss22 ${left.length}");
        listofdetilsmodel.add(MyCourcesModeldetails(left.first, val));
      }, (right) {
        print("get courcessss error ${right.eror} id====${val.uid}");
        resultfinish = Right(right);
      });
    });
    resultfinish = Left(listofdetilsmodel);
  } catch (e) {
    resultfinish = Right(Handleerror.fromjson(e.toString()));
  }
  return resultfinish;
}
