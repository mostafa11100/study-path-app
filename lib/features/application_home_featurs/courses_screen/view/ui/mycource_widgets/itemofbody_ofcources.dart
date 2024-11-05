import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/cubit/cubit_get_mycources/get_my_cources_cubit.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/data/models/instracturemodel.dart';

Widget itemofcources({required MyCourcesModeldetails model}) {
  return Builder(builder: (context) {
    CourseModel course = model.courseAllDetails!.courseModel!;
    InstractureModel instracture = model.courseAllDetails!.instractureModel!;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 140.h,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            AspectRatio(
              aspectRatio: 1.2,
              child: Container(
                //height: 150.h,

                decoration: BoxDecoration(
                    color: ColorApp.neturalcolor2,
                    borderRadius: BorderRadius.circular(8.r),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(course.coverurl!),
                    )),
              ),
            ),
            SizedBox(
              width: 20.w,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.0.r),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    course.title!,
                    style: TextStyleConst.textStyleconst13!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                  Text(
                    instracture.name!,
                    style: TextStyleConst.textStyleconst11!.copyWith(
                        color: ColorApp.neturalcolor9,
                        fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 4.h,
                    child: SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        thumbShape: RoundSliderThumbShape(
                            enabledThumbRadius: 4.5.r), // يمكنك تعديل الحجم هنا
                        overlayShape: const RoundSliderOverlayShape(
                            overlayRadius:
                                .0), // يمكنك تعديل حجم الـ overlay هنا
                      ),
                      child: Slider(
                        activeColor: ColorApp.primarycolor6,
                        thumbColor: ColorApp.primarycolor6,
                        value: (model.coursedata!.complete! /
                                (course.videos!.length > 0
                                    ? course.videos!.length
                                    : (model.coursedata!.complete! * 2)))
                            .toDouble(),
                        min: 0,
                        max: 1,
                        onChanged: (newValue) {
                          // setState(() {
                          //   _sliderValue = newValue;
                          // });
                        },
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${course.videos!.length} Lesson",
                        style: TextStyleConst.textStyleconst11!.copyWith(
                            color: ColorApp.neturalcolor9,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 20.w,
                      ),
                      Text(
                        "${model.coursedata!.complete} Lesson",
                        style: TextStyleConst.textStyleconst11!.copyWith(
                            color: ColorApp.neturalcolor9,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  });
}
