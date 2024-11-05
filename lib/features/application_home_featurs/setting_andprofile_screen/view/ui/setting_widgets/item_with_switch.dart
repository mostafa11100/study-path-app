import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

Widget itemofsettingsscreenwithswich(
    {required IconData leadingicondata,
    required String text,
    required bool active,
    required Function(bool val) setstate}) {
  return ListTile(
    leading: Icon(
      leadingicondata,
      color: ColorApp.neturalcolor10,
      size: 24.r,
    ),
    title: Text(
      text,
      style: TextStyleConst.textStyleconst14,
    ),
    trailing: Transform.scale(
      scale: .7,
      child: Switch(
          trackOutlineColor: WidgetStateColor.resolveWith((s) {
            return Colors.white;
          }),
          activeColor: Colors.white,
          activeTrackColor: ColorApp.primarycolor6,
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: ColorApp.neturalcolor4,
          splashRadius: 0.0,
          // boolean variable value
          value: active,
          // changes the state of the switch
          onChanged: setstate),
    ),
    horizontalTitleGap: 18.r,
  );
}
