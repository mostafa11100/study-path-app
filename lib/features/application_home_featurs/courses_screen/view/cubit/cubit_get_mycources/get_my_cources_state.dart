part of 'get_my_cources_cubit.dart';

@immutable
sealed class GetMyCourcesState {}

final class GetMyCourcesInitial extends GetMyCourcesState {}

final class GetMyCourcesSuccess extends GetMyCourcesState {
  List<MyCourcesModeldetails> mycourceslist;
  GetMyCourcesSuccess(this.mycourceslist);
}

final class GetMyCourcesLoading extends GetMyCourcesState {}

final class GetMyCourcesFail extends GetMyCourcesState {
  String error;
  GetMyCourcesFail(this.error);
}
