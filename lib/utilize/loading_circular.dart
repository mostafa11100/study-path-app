import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';

// ignore: non_constant_identifier_names
Widget LoadingCircular() {
  return Center(
      child: SizedBox(
          width: 20.w,
          height: 20.h,
          child: CircularProgressIndicator(
            color: ColorApp.neturalcolor12,
            strokeWidth: 3,
          )));
}
