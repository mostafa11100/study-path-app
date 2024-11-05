import 'package:flutter/material.dart';

Widget CustomButtom(
    {Function()? onpress,
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
