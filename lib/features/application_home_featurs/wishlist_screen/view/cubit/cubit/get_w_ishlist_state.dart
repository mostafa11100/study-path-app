part of 'get_w_ishlist_cubit.dart';

@immutable
sealed class GetWIshlistState {}

final class GetWIshlistInitial extends GetWIshlistState {}

final class GetWIshlistSucces extends GetWIshlistState {
  List<CourseAllDetails> result;
  GetWIshlistSucces(this.result);
}

final class GetWIshlistLoading extends GetWIshlistState {}

final class GetWIshlistFail extends GetWIshlistState {
  String error;
  GetWIshlistFail(this.error);
}
