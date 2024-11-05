import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:study_path/utilize/gineralmodels/video_model.dart';

part 'change_video_state.dart';

class ChangeVideoCubit extends Cubit<ChangeVideoState> {
  ChangeVideoCubit(this.video) : super(ChangeVideoInitial(video));
  final VideoModel video;
  change(VideoModel video) {
    emit(ChangeVideoSucces(video));
  }
}
