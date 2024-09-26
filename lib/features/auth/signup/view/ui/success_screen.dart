import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/functions/goroute_fun.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/custom_Button.dart';

class CreatedAcountSuccess extends StatelessWidget {
  const CreatedAcountSuccess({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Success",
              style: TextStyleConst.textStyleconst22,
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Your Acount has been created pleas check your email  and log in again",
              style: TextStyleConst.textStyleconst17!
                  .copyWith(color: ColorApp.neturalcolor10),
            ),
            SizedBox(
              height: 50.h,
            ),
            Container(
              width: 150.w,
              height: 150.h,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: ColorApp.primarycolor6, width: 3)),
              child: Center(
                child: Icon(Icons.done_outlined,
                    size: 35, color: ColorApp.primarycolor6),
              ),
            ),
            Spacer(),
            CustomButtom(
                onpress: () {
                  GoR(
                    context: context,
                    name: Approuter.signin,
                  );
                },
                text: Text(
                  S.current.LogIn,
                  style: TextStyleConst.textStyleconst17,
                ),
                w: 140.w,
                h: 50.h,
                colordata: ColorApp.primarycolor6),
            SizedBox(
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
