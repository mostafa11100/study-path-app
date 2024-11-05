import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/const/images_assets.dart';
import 'package:study_path/functions/goroute_fun.dart';
import 'package:study_path/utilize/custom_Button.dart';

class PasswordCreatedSuccesScreen extends StatelessWidget {
  const PasswordCreatedSuccesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.h,
              width: 200.w,
              child: Image.asset(
                ImagesAssets.security_passowrdimage,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Congrateulation",
              style: TextStyleConst.textStyleconst20,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "You Have Succesfully Update Your Password now you can log in again",
              textAlign: TextAlign.center,
              style: TextStyleConst.textStyleconst20,
            ),
            SizedBox(
              height: 40.h,
            ),
            CustomButtom(
                onpress: () {
                  GoR(context: context, name: Approuter.signin);
                },
                text: Text(
                  "Login",
                  style: TextStyleConst.textStyleconst17!
                      .copyWith(color: Colors.white),
                ),
                w: MediaQuery.of(context).size.width / 1.8,
                h: 50.h,
                colordata: ColorApp.primarycolor6)
          ],
        ),
      ),
    );
  }
}
