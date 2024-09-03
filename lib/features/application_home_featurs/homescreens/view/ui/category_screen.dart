// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/courses_list.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, required this.category});
  String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        surfaceTintColor: null,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          category,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(fontWeight: FontWeight.w800),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
            child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            courses(courses: [
              CourseModel(),
              CourseModel(),
              CourseModel(),
              CourseModel()
            ], context: context, coursestitle: "Courses to get srarted"),
            SizedBox(
              height: 20.h,
            ),
            courses(
                titlestyle: Theme.of(context)
                    .textTheme
                    .displaySmall!
                    .copyWith(fontWeight: FontWeight.w800),
                courses: [
                  CourseModel(),
                  CourseModel(),
                  CourseModel(),
                  CourseModel()
                ],
                context: context,
                coursestitle: "Featured courses")
          ],
        )),
      ),
    );
  }
}
