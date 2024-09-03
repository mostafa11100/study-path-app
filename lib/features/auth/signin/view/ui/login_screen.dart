// ignore_for_file: must_be_immutable

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/const/images_assets.dart';
import 'package:study_path/features/auth/signin/view/ui/login_widgets/divider_andtext.dart';
import 'package:study_path/features/auth/signin/view/ui/login_widgets/remember_andforgetpass.dart';
import 'package:study_path/functions/goroute_fun.dart';
import 'package:study_path/functions/validations_functions/email_validation.dart';
import 'package:study_path/functions/validations_functions/password_validate.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/custom_Button.dart';
import 'package:study_path/utilize/passwordtextfeild.dart';
import 'package:study_path/utilize/textfeildcustom_auth.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController email = TextEditingController();

  TextEditingController passwordcon = TextEditingController();

  bool checkval = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding:
          const EdgeInsets.only(left: 20.0, right: 20.0, top: 30, bottom: 10),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 20.sp,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 20.r,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 5.4),
                Text(
                  S.of(context).Welcomeback,
                  style: TextStyleConst.textStyleconst23,
                ),
              ],
            ),
            SizedBox(
              height: 17.h,
            ),
            Text(
              S.of(context).LogIntoyouracount,
              style: TextStyleConst.textStyleconst17!
                  .copyWith(color: ColorApp.neturalcolor12),
            ),
            SizedBox(
              height: 50.h,
            ),
            Form(
                child: Column(
              children: [
                TextFeildCustom_Auth(
                    controler: email,
                    label: S.current.Emailorphonenumber,
                    validator: (t) {
                      String? validd = emailvalidation(t);
                      if (validd != "phone" && validd != "email") {
                        return validd;
                      }
                    })
              ],
            )),
            SizedBox(
              height: 20.h,
            ),
            PasswordTextfeild(
                label: S.current.Password,
                validator: PasswordValidate,
                controler: passwordcon),
            SizedBox(
              height: 15.h,
            ),
            Row(
              children: [
                rememberandforgetpassword(),
                Text(
                  S.current.rememberme,
                  style: TextStyleConst.textStyleconst11!.copyWith(
                      color: ColorApp.neturalcolor10, fontSize: 12.sp),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    GoR(context: context, name: Approuter.forgetpassword);
                  },
                  child: Text(
                    S.current.Forgetpassword,
                    style: TextStyleConst.textStyleconst13!.copyWith(
                        color: ColorApp.primarycolor6, fontSize: 12.sp),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            CustomButtom(
                onpress: () {
                  GoR(context: context, name: Approuter.homescreenapp);
                },
                text: Text(
                  "Login",
                  style: TextStyleConst.textStyleconst16!
                      .copyWith(color: Colors.white),
                ),
                w: MediaQuery.of(context).size.width,
                h: 47.h,
                colordata: ColorApp.primarycolor6),
            DividerAndOrlogwith(),
            SizedBox(
              height: 15.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
              SizedBox(
                  width: 30.w,
                  height: 30.h,
                  child: InkWell(
                    child: Image.asset(ImagesAssets.facebook),
                  )),
              SizedBox(
                  width: 30.w,
                  height: 30.h,
                  child: InkWell(
                    child: Image.asset(ImagesAssets.googleimage),
                  )),
              SizedBox(
                  width: 30.w,
                  height: 30.h,
                  child: InkWell(
                    child: Image.asset(ImagesAssets.linedin),
                  ))
            ]),
            SizedBox(
              height: 55.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 0),
              child: Row(
                children: [
                  Text(
                    S.current.Donthaveanacount,
                    style: TextStyleConst.textStyleconst13!
                        .copyWith(color: ColorApp.neturalcolor10),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      GoR(context: context, name: Approuter.signin);
                    },
                    child: Column(
                      children: [
                        Text(
                          S.current.SignUp,
                          style: TextStyleConst.textStyleconst13!
                              .copyWith(color: ColorApp.primarycolor6),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
