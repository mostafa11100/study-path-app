import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

// ignore: non_constant_identifier_names
Widget TextFeildCustom_Auth({controler, hint, label, validator}) {
  return Builder(builder: (context) {
    return TextFormField(
      controller: controler,
      style: TextStyleConst.textStyleconst15,
      maxLines: 1,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 4.h),
        floatingLabelStyle: TextStyleConst.textStyleconst17!,
        labelStyle: TextStyleConst.textStyleconst13!
            .copyWith(color: ColorApp.neturalcolor10, height: 1.2.h),
        border: InputBorder.none,
        focusedErrorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorApp.primarycolor6, width: .8.r)),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorApp.erroscolor5, width: .8.r)),
        enabledBorder: UnderlineInputBorder(
            borderSide:
                BorderSide(color: ColorApp.neturalcolor10, width: .8.r)),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: ColorApp.primarycolor6, width: .8.r)),
        hintText: hint,
      ),
    );
  });
}
