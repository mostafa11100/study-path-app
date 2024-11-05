part of 'sendverify_cubit.dart';

@immutable
sealed class SendverifyState {}

final class SendverifyInitial extends SendverifyState {}

final class SendverifyLoading extends SendverifyState {}

final class SendverifySucces extends SendverifyState {}

final class SendverifyFail extends SendverifyState {
  String error;
  SendverifyFail(this.error);
}
