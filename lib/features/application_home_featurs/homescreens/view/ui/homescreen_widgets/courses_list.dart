import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/course_item.dart';
import 'package:study_path/utilize/getcources_and_instracture/get_instracture_and_cources.dart';

Widget courses(
    {context,
    required List<CourseAllDetails> courses,
    required String coursestitle,
    TextStyle? titlestyle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          coursestitle,
          style: titlestyle ?? TextStyleConst.textStyleconst17,
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 270.h,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: courses.length,
            itemBuilder: (context, i) {
              return Card(
                color: Colors.white,
                elevation: 1.4,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: courseitem(
                    ontap: () {},
                    context: context,
                    coursemodel: courses[i],
                  ),
                ),
              );
            }),
      ),
    ],
  );
}
