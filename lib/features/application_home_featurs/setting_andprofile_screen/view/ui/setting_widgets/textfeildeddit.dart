import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

Widget TextFeildCustom_editing({controler, hint, label, validator, security}) {
  return Builder(builder: (context) {
    return TextFormField(
      obscureText: security ?? false,
      controller: controler,
      style: TextStyleConst.textStyleconst15,
      maxLines: 1,
      validator: validator,
      decoration: InputDecoration(
          suffixIcon: Icon(
            Icons.edit_outlined,
            color: ColorApp.neturalcolor10,
            size: 18.r,
          ),
          labelText: label,
          contentPadding: EdgeInsets.symmetric(vertical: 9.h, horizontal: 1.w),
          floatingLabelStyle: TextStyleConst.textStyleconst17!,
          labelStyle: TextStyleConst.textStyleconst13!
              .copyWith(color: ColorApp.neturalcolor9, height: 1.2.h),
          border: InputBorder.none,
          focusedErrorBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorApp.primarycolor6, width: .8.r)),
          errorBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: ColorApp.erroscolor5, width: .8.r)),
          enabledBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorApp.neturalcolor9, width: .8.r)),
          focusedBorder: UnderlineInputBorder(
              borderSide:
                  BorderSide(color: ColorApp.primarycolor6, width: .8.r)),
          hintText: hint,
          hintStyle: TextStyleConst.textStyleconst12!
              .copyWith(color: ColorApp.neturalcolor9)),
    );
  });
}
