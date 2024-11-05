import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/generated/l10n.dart';

Widget courseiteminstracture(
    {context, required CourseModel coursemodel, required Function() ontap}) {
  bool active = false;
  return SizedBox(
    // height: 200,
    width: 205.w,

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(coursemodel.coverurl!),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r))),
          height: 130.h,
        ),
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 6.w),
          leading: Text(
            coursemodel.title!,
            style: TextStyleConst.textStyleconst15,
          ),
          trailing: StatefulBuilder(builder: (context, setstate) {
            return InkWell(
              onTap: () {
                setstate(() {
                  ontap();
                  active = !active;
                });
              },
              child: Icon(
                Icons.favorite_outline,
                size: 23.r,
                color: active == true
                    ? ColorApp.primarycolor6
                    : ColorApp.neturalcolor11,
              ),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Text(
                "${coursemodel.time!.toString()}Hours",
                style: TextStyleConst.textStyleconst12!
                    .copyWith(color: ColorApp.neturalcolor10),
              ),
              SizedBox(
                height: 7.w,
              ),
              Row(
                children: [
                  Text(
                    "${coursemodel.price!}\$",
                    style: TextStyleConst.textStyleconst13!.copyWith(
                        color: ColorApp.neturalcolor12,
                        decoration: TextDecoration.lineThrough),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "${coursemodel.discount}\$",
                    style: TextStyleConst.textStyleconst13!,
                  ),
                  const Spacer(),
                  Text(S.current.BuyNow,
                      style: TextStyleConst.textStyleconst13!.copyWith(
                          color: ColorApp.primarycolor6,
                          fontWeight: FontWeight.w700,
                          decoration: TextDecoration.underline,
                          decorationColor: ColorApp.primarycolor6))
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

int calculateDaysUntil(DateTime targetDate) {
  DateTime today = DateTime.now(); // الحصول على التاريخ الحالي
  Duration difference =
      targetDate.difference(today); // حساب الفرق بين التاريخين
  return difference.inDays; // إرجاع عدد الأيام
}
