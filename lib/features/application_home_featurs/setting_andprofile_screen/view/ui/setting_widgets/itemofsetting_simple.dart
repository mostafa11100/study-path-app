import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
      size: 26.r,
    ),
    title: Text(
      text,
      style: TextStyleConst.textStyleconst15,
    ),
    trailing: Icon(
      trailing,
      size: 26.r,
    ),
    horizontalTitleGap: 20.r,
  );
}
