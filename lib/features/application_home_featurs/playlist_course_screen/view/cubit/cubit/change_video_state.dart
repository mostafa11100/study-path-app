// ignore_for_file: overridden_fields

part of 'change_video_cubit.dart';

@immutable
sealed class ChangeVideoState {
  VideoModel? model;
}

final class ChangeVideoInitial extends ChangeVideoState {
  @override
  VideoModel? model;
  ChangeVideoInitial(this.model);
}

final class ChangeVideoSucces extends ChangeVideoState {
  @override
  VideoModel? model;
  ChangeVideoSucces(this.model);
}
