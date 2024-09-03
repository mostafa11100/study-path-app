import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/course_item.dart';

Widget courses(
    {context,
    required List<CourseModel> courses,
    required String coursestitle,
    TextStyle? titlestyle}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          coursestitle,
          style: titlestyle ??
              Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.w700),
        ),
      ),
      const SizedBox(
        height: 8,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 310.h,
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
