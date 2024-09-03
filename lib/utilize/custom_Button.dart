import 'package:flutter/material.dart';
import 'package:study_path/const/color_app.dart';

Widget CustomButtom(
    {required Function() onpress,
    required Widget text,
    required double w,
    required double h,
    required Color colordata}) {
  return Builder(builder: (context) {
    return SizedBox(
      width: w,
      height: h,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(backgroundColor: colordata),
            onPressed: onpress,
            child: text),
      ),
    );
  });
}
