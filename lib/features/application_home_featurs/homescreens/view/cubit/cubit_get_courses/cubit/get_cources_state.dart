part of 'get_cources_cubit.dart';

@immutable
sealed class GetCourcesState {}

final class GetCourceInitial extends GetCourcesState {}

final class GetCourcesLoading extends GetCourcesState {}

final class GetCourcesSucces extends GetCourcesState {
  List<CourseAllDetails> cources;
  GetCourcesSucces(this.cources);
}

final class GetCourcesFail extends GetCourcesState {
  String error;
  GetCourcesFail(this.error);
}
