part of 'create_acount_cubit.dart';

@immutable
sealed class CreateAcountState {}

final class CreateAcountInitial extends CreateAcountState {}

final class CreateAcountLoading extends CreateAcountState {}

final class CreateAcountSuccess extends CreateAcountState {}

// ignore: must_be_immutable
final class CreateAcountFail extends CreateAcountState {
  String error;
  CreateAcountFail(this.error);
}
