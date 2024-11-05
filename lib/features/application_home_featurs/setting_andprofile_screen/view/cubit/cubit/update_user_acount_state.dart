part of 'update_user_acount_cubit.dart';

@immutable
sealed class UpdateUserAcountState {}

final class UpdateUserAcountInitial extends UpdateUserAcountState {}

final class UpdateUserAcountLoading extends UpdateUserAcountState {}

final class UpdateUserAcountSucces extends UpdateUserAcountState {}

final class UpdateUserAcountFail extends UpdateUserAcountState {
  Handleerror error;
  UpdateUserAcountFail(this.error);
}
