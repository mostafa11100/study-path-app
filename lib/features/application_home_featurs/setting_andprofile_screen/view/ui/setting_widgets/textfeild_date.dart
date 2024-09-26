import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

Widget TextFeildCustom_date(
    {controler, hint, label, validator, List<DateTime>? value, dateontap}) {
  return Builder(builder: (context) {
    return TextFormField(
      controller: controler,
      style: TextStyleConst.textStyleconst15,
      maxLines: 1,
      validator: validator,
      decoration: InputDecoration(
          suffixIcon: InkWell(
              onTap: dateontap,
              child: const Icon(Icons.arrow_drop_down_outlined)),
          labelText: label,
          contentPadding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 1.w),
          floatingLabelStyle: TextStyleConst.textStyleconst17!,
          labelStyle: TextStyleConst.textStyleconst13!
              .copyWith(color: ColorApp.neturalcolor10, height: 1.2.h),
          border: InputBorder.none,
          focusedErrorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorApp.primarycolor6, width: .8.r)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorApp.erroscolor5, width: .8.r)),
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorApp.neturalcolor10, width: .8.r)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorApp.primarycolor6, width: .8.r)),
          hintText: hint,
          hintStyle: TextStyleConst.textStyleconst12!
              .copyWith(color: ColorApp.neturalcolor9)),
    );
  });
}
