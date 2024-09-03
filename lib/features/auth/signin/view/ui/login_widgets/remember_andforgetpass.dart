import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';

Widget rememberandforgetpassword() {
  bool checkval = false;
  return StatefulBuilder(builder: (context, state) {
    return SizedBox(
      height: 20.sp,
      width: 20.sp,
      child: Checkbox(
          activeColor: ColorApp.primarycolor4,
          value: checkval,
          onChanged: (v) {
            state(() {
              checkval = v!;
            });
          }),
    );
  });
}
