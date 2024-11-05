import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

showloadingdialog(context) {
  showDialog(
      context: context,
      builder: (context) {
        return Center(
          child: SizedBox(
            width: 20.w,
            height: 20.h,
            child: const CircularProgressIndicator(
              strokeWidth: 1.5,
              color: Colors.white,
            ),
          ),
        );
      });
}
