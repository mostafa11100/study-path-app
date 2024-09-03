import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/generated/l10n.dart';

Widget courseitem(
    {context, required CourseModel coursemodel, required Function() ontap}) {
  bool active = false;
  return SizedBox(
    // height: 200,
    width: 220,

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(coursemodel.image!), fit: BoxFit.cover),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.r),
                  topRight: Radius.circular(10.r))),
          height: 150.h,
        ),
        ListTile(
          contentPadding: const EdgeInsets.all(6),
          leading: Text(
            coursemodel.coursename!,
            style: Theme.of(context)
                .textTheme
                .titleLarge!
                .copyWith(fontWeight: FontWeight.w700),
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
                color: active == true
                    ? ColorApp.primarycolor6
                    : ColorApp.neturalcolor11,
              ),
            );
          }),
        ),
        Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                coursemodel.instracure!,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                    color: ColorApp.neturalcolor9, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 6.h,
              ),
              Text(
                coursemodel.time!,
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: ColorApp.neturalcolor9, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 7.w,
              ),
              Row(
                children: [
                  Text(
                    coursemodel.price!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorApp.neturalcolor9,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    coursemodel.descaond!,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: ColorApp.neturalcolor12,
                        fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    width: 70.w,
                  ),
                  Text(
                    S.current.BuyNow,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: ColorApp.primarycolor6,
                        decoration: TextDecoration.underline),
                  )
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
