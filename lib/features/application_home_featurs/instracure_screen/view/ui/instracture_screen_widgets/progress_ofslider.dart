import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

Widget progressSliderState(
    {context,
    required double excelent,
    required double verygood,
    required double good,
    required double poor}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              "Excelent",
              style: TextStyleConst.textStyleconst15,
            ),
            const Spacer(),
            SizedBox(
              height: 4,
              width: MediaQuery.of(context).size.width / 1.6,
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(8.r),
                value: excelent,
                backgroundColor: Colors.grey[300], // لون الخلفية
                color: ColorApp.sucesscolor6, // لون التقدم
                minHeight: 4.2.h, // ارتفاع الشريط
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Text(
              "Very Good",
              style: TextStyleConst.textStyleconst15,
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.6,
              height: 4,
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(8.r),
                value: verygood,
                backgroundColor: Colors.grey[300], // لون الخلفية
                color: ColorApp.sucesscolor4, // لون التقدم
                minHeight: 4.5.h, // ارتفاع الشريط
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Text(
              "Good",
              style: TextStyleConst.textStyleconst15,
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.6,
              height: 4,
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(8.r),
                value: good,
                backgroundColor: Colors.grey[300], // لون الخلفية
                color: Colors.yellow, // لون التقدم
                minHeight: 4.5.h, // ارتفاع الشريط
              ),
            ),
          ],
        ),
        SizedBox(
          height: 8.h,
        ),
        Row(
          children: [
            Text(
              "Poor",
              style: TextStyleConst.textStyleconst15,
            ),
            const Spacer(),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.6,
              height: 4,
              child: LinearProgressIndicator(
                borderRadius: BorderRadius.circular(8.r),
                value: poor,
                backgroundColor: Colors.grey[300], // لون الخلفية
                color: ColorApp.erroscolor5, // لون التقدم
                minHeight: 4.5.h, // ارتفاع الشريط
              ),
            ),
          ],
        ),
      ],
    ),
  );
}
