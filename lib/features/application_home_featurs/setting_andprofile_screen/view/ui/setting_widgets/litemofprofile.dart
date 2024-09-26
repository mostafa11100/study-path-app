// ignore: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

Widget customlisttile_ofprofile({img, title, subtitle, ontap}) {
  return ListTile(
    onTap: ontap,
    leading: CircleAvatar(
      radius: 28.r,
      backgroundImage: NetworkImage(
        img,
      ),
    ),
    horizontalTitleGap: 20.w,
    title: Text(
      title,
      style: TextStyleConst.textStyleconst16,
    ),
    subtitle: Text(
      subtitle,
      style: TextStyleConst.textStyleconst12!
          .copyWith(color: ColorApp.neturalcolor11),
    ),
  );
}
