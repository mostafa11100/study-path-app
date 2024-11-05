part of 'change_password_cubit.dart';

@immutable
sealed class ChangePasswordState {}

final class ChangePasswordInitial extends ChangePasswordState {}

final class ChangePasswordLoading extends ChangePasswordState {}

final class ChangePasswordSucces extends ChangePasswordState {}

final class ChangePasswordFail extends ChangePasswordState {
  Handleerror error;
  ChangePasswordFail(this.error);
}
