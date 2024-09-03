import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';

Widget otpcustomwidget(context) {
  return OtpTextField(
    fieldHeight: 43.h,
    numberOfFields: 4,
    filled: true,
    fillColor: ColorApp.neturalcolor2,
    textStyle: Theme.of(context)
        .textTheme
        .labelLarge!
        .copyWith(fontWeight: FontWeight.w600),
    borderColor: ColorApp.primarycolor6,
    //set to true to show as box or false to show as dash
    showFieldAsBox: true,
    //runs when a code is typed in
    onCodeChanged: (String code) {
      //handle validation or checks here
    },
    //runs when every textfield is filled
    onSubmit: (String verificationCode) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Verification Code"),
              content: Text('Code entered is $verificationCode'),
            );
          });
    }, // end onSubmit
  );
}
