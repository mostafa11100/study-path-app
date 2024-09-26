import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycource_widgets/itemofrelated_course.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';

Widget relatedcourcesscreen() {
  return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: itemofrelatedcource(context, CourseModel(), () {}),
        );
      });
}
