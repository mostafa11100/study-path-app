import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/generated/l10n.dart';

// ignore: non_constant_identifier_names
Widget TextFeildCustom_Auth(
    {controler, hint, label, String? Function(String?)? validator}) {
  return Builder(builder: (context) {
    return TextFormField(
      controller: controler,
      style: TextStyleConst.textStyleconst15,
      maxLines: 1,
      validator: validator,
      decoration: InputDecoration(
        hintStyle: TextStyleConst.textStyleconst11!
            .copyWith(color: ColorApp.neturalcolor10),
        labelText: label,
        contentPadding: EdgeInsets.symmetric(vertical: 4.h),
        floatingLabelStyle: TextStyleConst.textStyleconst17!,
        labelStyle: TextStyleConst.textStyleconst13!
            .copyWith(color: ColorApp.neturalcolor9, height: 1.2.h),
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
