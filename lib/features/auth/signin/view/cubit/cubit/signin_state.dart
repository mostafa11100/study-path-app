// ignore_for_file: must_be_immutable

part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninFail extends SigninState {
  String error;
  SigninFail(this.error);
}

final class SigninNotverify extends SigninState {
  String text;
  SigninNotverify(this.text);
}

final class SigninLoadingfacbook extends SigninState {}

final class SigninSucces extends SigninState {}
