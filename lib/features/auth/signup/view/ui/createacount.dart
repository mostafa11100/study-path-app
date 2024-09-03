import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/auth/signup/view/ui/create_widgets.dart/haveacount_or_login.dart';
import 'package:study_path/functions/validations_functions/email_validation.dart';
import 'package:study_path/functions/validations_functions/empty_validate.dart';
import 'package:study_path/functions/validations_functions/password_validate.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/custom_Button.dart';
import 'package:study_path/utilize/passwordtextfeild.dart';
import 'package:study_path/utilize/textfeildcustom_auth.dart';

// ignore: must_be_immutable
class CreateacountScreen extends StatelessWidget {
  CreateacountScreen({super.key});

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  valid() {
    if (formkey.currentState != null) {
      formkey.currentState!.validate();
    }
  }

  TextEditingController firstname = TextEditingController();

  TextEditingController lasttname = TextEditingController();

  TextEditingController emailorphone = TextEditingController();

  TextEditingController password = TextEditingController();

  TextEditingController comfertpass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 30.h,
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
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 5.6,
                    ),
                    Text(
                      S.of(context).CreateYourAcount,
                      style: TextStyleConst.textStyleconst20,
                    ),
                  ],
                ),
                SizedBox(
                  height: 25.h,
                ),
                Form(
                  key: formkey,
                  child: Column(
                    children: [
                      TextFeildCustom_Auth(
                          controler: firstname,
                          label: S.of(context).Firstname,
                          validator: validateeifempty),
                      SizedBox(
                        height: 25.h,
                      ),
                      TextFeildCustom_Auth(
                        controler: lasttname,
                        label: S.of(context).Lastname,
                        validator: validateeifempty,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      TextFeildCustom_Auth(
                        controler: emailorphone,
                        label: S.of(context).Emailorphonenumber,
                        validator: (t) {
                          String? emailv = emailvalidation(t);
                          if (emailv == "email" || emailv == "phone") {
                          } else {
                            return emailv;
                          }
                        },
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      PasswordTextfeild(
                        controler: password,
                        label: S.current.Password,
                        validator: PasswordValidate,
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      PasswordTextfeild(
                        controler: comfertpass,
                        label: S.current.Comfertpassword,
                        validator: (t) {
                          if (password.text != t) {
                            return "Please confirm the password";
                          }
                        },
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      CustomButtom(
                          onpress: () {
                            valid();
                          },
                          text: Text(
                            S.current.LogIn,
                            style: TextStyleConst.textStyleconst16!
                                .copyWith(color: Colors.white),
                          ),
                          w: MediaQuery.of(context).size.width,
                          h: 46.h,
                          colordata: ColorApp.primarycolor6),
                      SizedBox(
                        height: 80.h,
                      ),
                      haveAcountorlogin()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
