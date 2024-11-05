import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

Widget itemofsettingsscreen(
    {required IconData leadingicondata,
    required String text,
    IconData? trailing,
    required Function() ontap}) {
  return ListTile(
    onTap: ontap,
    leading: Icon(
      leadingicondata,
      color: ColorApp.neturalcolor10,
      size: 24.r,
    ),
    title: Text(
      text,
      style: TextStyleConst.textStyleconst14,
    ),
    trailing: Icon(
      trailing,
      size: 23.r,
    ),
    horizontalTitleGap: 18.r,
  );
}
