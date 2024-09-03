import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/custom_Button.dart';

class LoginAndSignupCustomContainer extends StatelessWidget {
  const LoginAndSignupCustomContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
          color: ColorApp.primarycolor1.withOpacity(.6),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(74.r), topRight: Radius.circular(74.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width / 2,
            child: Text(
              S.of(context).Welcome,
              style:
                  TextStyleConst.textStyleconst25!.copyWith(fontSize: 25.spMin),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20.h,
          ),
          CustomButtom(
              onpress: () {
                GoRouter.of(context).push(Approuter.signup);
              },
              text: Text(
                S.of(context).SignUp,
                style: TextStyleConst.textStyleconst18!
                    .copyWith(color: Colors.white),
              ),
              w: MediaQuery.of(context).size.width,
              h: MediaQuery.of(context).size.width / 8,
              colordata: ColorApp.primarycolor6),
          SizedBox(
            height: 15.h,
          ),
          CustomButtom(
              onpress: () {},
              text: Text(
                S.of(context).LogIn,
                style: TextStyleConst.textStyleconst18,
              ),
              w: MediaQuery.of(context).size.width,
              h: 50.h,
              colordata: ColorApp.neturalcolor1),
        ],
      ),
    );
  }
}
