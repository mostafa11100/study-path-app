part of 'check_code_verify_cubit.dart';

@immutable
sealed class CheckCodeVerifyState {}

final class CheckCodeVerifyInitial extends CheckCodeVerifyState {}

final class CheckCodeVerifyLoading extends CheckCodeVerifyState {}

final class CheckCodeVerifySucces extends CheckCodeVerifyState {}

final class CheckCodeVerifyFail extends CheckCodeVerifyState {
  String error;
  CheckCodeVerifyFail(this.error);
}
