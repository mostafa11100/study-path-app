import 'package:either_dart/either.dart';
import 'package:study_path/class/handlerror/handleerror.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';

abstract class GetCources {
  Future<Either<List<CourseModel>, Handleerror>?> getcources(
      {filter, collection, docs});
}
