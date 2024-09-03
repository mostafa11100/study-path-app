import 'package:flutter/material.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget customverifysendbutton({
  h,
  text,
  color,
  ontap,
}) {
  return InkWell(
    onTap: ontap,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 25),
      height: h,
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(30.r)),
      child: Row(
        children: [
          Text(text,
              style: TextStyleConst.textStyleconst15!.copyWith(
                  color: color == ColorApp.primarycolor6
                      ? ColorApp.neturalcolor1
                      : ColorApp.neturalcolor12)),
          const Spacer(),
          Icon(
            Icons.arrow_forward,
            color: color == ColorApp.primarycolor6
                ? ColorApp.neturalcolor1
                : ColorApp.primarycolor6,
          )
        ],
      ),
    ),
  );
}
