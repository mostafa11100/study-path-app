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
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 20.h),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 130.h,
              ),
              Text(
                "Success",
                style: TextStyleConst.textStyleconst25,
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                "Your Acount has been created pleas check your email  and login again",
                textAlign: TextAlign.center,
                style: TextStyleConst.textStyleconst16!
                    .copyWith(color: ColorApp.neturalcolor10),
              ),
              SizedBox(
                height: 50.h,
              ),
              Container(
                width: 200.w,
                height: 200.h,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border:
                        Border.all(color: ColorApp.primarycolor6, width: 3.5)),
                child: Center(
                  child: Icon(Icons.done_outlined,
                      size: 65, color: ColorApp.primarycolor6),
                ),
              ),
              const Spacer(),
              CustomButtom(
                  onpress: () {
                    GoRR(
                      context: context,
                      name: Approuter.signin,
                    );
                  },
                  text: Text(
                    S.current.LogIn,
                    style: TextStyleConst.textStyleconst18!
                        .copyWith(color: Colors.white),
                  ),
                  w: MediaQuery.of(context).size.width,
                  h: 50.h,
                  colordata: ColorApp.primarycolor6),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
