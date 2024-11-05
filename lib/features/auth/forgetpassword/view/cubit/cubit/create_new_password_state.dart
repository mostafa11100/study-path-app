part of 'create_new_password_cubit.dart';

@immutable
sealed class CreateNewPasswordState {}

final class CreateNewPasswordInitial extends CreateNewPasswordState {}

final class CreateNewPasswordLoading extends CreateNewPasswordState {}

final class CreateNewPasswordSuccess extends CreateNewPasswordState {}

final class CreateNewPasswordFail extends CreateNewPasswordState {
  String error;
  CreateNewPasswordFail(this.error);
}
