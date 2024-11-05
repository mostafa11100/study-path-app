import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/auth/forgetpassword/view/ui/forgetpass_widgets/customsendverify_button.dart';
import 'package:study_path/functions/goroute_fun.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/custom_Button.dart';

class ForgetpasswordScreen extends StatelessWidget {
  const ForgetpasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      GoRouter.of(context).pop();
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 20.r,
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 6.2),
                Text(
                  S.of(context).Forgetpassword,
                  textAlign: TextAlign.center,
                  style: TextStyleConst.textStyleconst22!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),
            Text(
              S.of(context).verifyyouidentify,
              textAlign: TextAlign.center,
              style: TextStyleConst.textStyleconst28!.copyWith(
                fontWeight: FontWeight.w100,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              S.of(context).selectmethode,
              textAlign: TextAlign.center,
              style: TextStyleConst.textStyleconst17!.copyWith(
                  color: ColorApp.neturalcolor12, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 55.h,
            ),
            customverifysendbutton(
                h: 50.h,
                text: S.current.verifybyemail,
                color: ColorApp.neturalcolor2,
                ontap: () {}),
            SizedBox(
              height: 25.h,
            ),
            customverifysendbutton(
                h: 50.h,
                text: S.current.verifybysms,
                color: ColorApp.primarycolor6,
                ontap: () {}),
            SizedBox(
              height: 25.h,
            ),
            customverifysendbutton(
                h: 50.h,
                text: S.current.VerifyByphonecall,
                color: ColorApp.neturalcolor2,
                ontap: () {}),
            SizedBox(
              height: 55.h,
            ),
            CustomButtom(
                onpress: () {
                  GoRouter.of(context).push(Approuter.createnewpass);
                },
                text: Text(
                  S.current.Continue,
                  style: TextStyleConst.textStyleconst16!
                      .copyWith(color: Colors.white),
                ),
                w: MediaQuery.of(context).size.width,
                h: 50.h,
                colordata: ColorApp.primarycolor6),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: Row(
                children: [
                  Text(
                    S.current.IRemembermypassword,
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
                          S.current.LogIn,
                          style: TextStyleConst.textStyleconst13!
                              .copyWith(color: ColorApp.primarycolor6),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10.h,
            )
          ],
        ),
      ),
    );
  }
}
