import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

// ignore: non_constant_identifier_names
Widget PasswordTextfeild(
    {controler, label, String? Function(String?)? validator}) {
  bool obsecure = true;
  return StatefulBuilder(builder: (context, setstate) {
    return TextFormField(
      obscureText: obsecure,
      controller: controler,
      style: TextStyleConst.textStyleconst15,
      maxLines: 1,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: InkWell(
            borderRadius: BorderRadius.circular(10.r),
            onTap: () {
              setstate(() {
                obsecure = !obsecure;
              });
            },
            child: Icon(
              obsecure ? Icons.visibility_off : Icons.visibility,
              color: ColorApp.neturalcolor10,
              size: 20.r,
            )),
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
      ),
    );
  });
}
