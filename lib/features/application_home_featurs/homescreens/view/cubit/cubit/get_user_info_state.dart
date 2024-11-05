part of 'get_user_info_cubit.dart';

@immutable
sealed class GetUserInfoState {}

final class GetUserInfoInitial extends GetUserInfoState {}

final class GetUserInfoLoading extends GetUserInfoState {}

final class GetUserInfoSuccess extends GetUserInfoState {
  UserModel user;
  GetUserInfoSuccess(this.user);
}

final class GetUserInfoFail extends GetUserInfoState {
  String error;
  GetUserInfoFail(this.error);
}
