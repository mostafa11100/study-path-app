// ignore_for_file: must_be_immutable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/cubit/cubit_get_courses/cubit/get_cources_cubit.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/course_item.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/courses_list.dart';
import 'package:study_path/utilize/getcources_and_instracture/get_instracture_and_cources.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key, required this.category});
  String category;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetCourcesCubit()
        ..getcources(Filter('category', isEqualTo: "software")),
      child: Scaffold(
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
        body: BlocBuilder<GetCourcesCubit, GetCourcesState>(
          builder: (context, state) {
            if (state is GetCourcesSucces) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 30.h,
                    ),
                    courses(
                        courses: state.cources,
                        context: context,
                        coursestitle: "Courses to get srarted"),
                    SizedBox(
                      height: 20.h,
                    ),
                    coursesbypriority(
                        titlestyle: Theme.of(context)
                            .textTheme
                            .displaySmall!
                            .copyWith(fontWeight: FontWeight.w800),
                        courses: state.cources,
                        context: context,
                        coursestitle: "Featured courses")
                  ],
                )),
              );
            }
            if (state is GetCourcesFail) {
              return Center(
                child: Text(state.error),
              );
            }
            {
              return Center(
                child: SizedBox(
                  width: 20.w,
                  height: 20.h,
                  child: const CircularProgressIndicator(
                    color: Colors.black,
                    strokeWidth: 2.4,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

Widget coursesbypriority(
    {context,
    required List<CourseAllDetails> courses,
    required String coursestitle,
    TextStyle? titlestyle}) {
  List<CourseAllDetails> courcespr = courcesbyprcalc(courses);
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
            itemCount: courcespr.length,
            itemBuilder: (context, i) {
              return Card(
                color: Colors.white,
                elevation: 1.4,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: courseitem(
                    ontap: () {},
                    context: context,
                    coursemodel: courcespr[i],
                  ),
                ),
              );
            }),
      ),
    ],
  );
}

calclengthofpr(List<CourseAllDetails> models) {
  int sum = 0;
  models.forEach((e) {
    if (e.courseModel!.priority! > 9) {
      sum += 1;
    }
  });
  return sum;
}

List<CourseAllDetails> courcesbyprcalc(List<CourseAllDetails> models) {
  List<CourseAllDetails> r = [];
  models.forEach((e) {
    if (e.courseModel!.priority! > 9) {
      r.add(e);
    }
  });
  return r;
}
