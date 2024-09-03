import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/images_assets.dart';
import 'package:study_path/functions/goroute_fun.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/custom_Button.dart';

class CreatepassDonescreen extends StatelessWidget {
  const CreatepassDonescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 170.w,
                child: Image.asset(ImagesAssets.security_passowrdimage),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                S.current.Congrateulations,
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                width: 230.w,
                child: Text(
                  S.current.youhavesuccessfullyupdate,
                  textAlign: TextAlign.center,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              CustomButtom(
                  onpress: () {
                    GoR(context: context, name: Approuter.signin);
                  },
                  text: Text(
                    S.current.LogIn,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.w500, color: Colors.white),
                  ),
                  w: MediaQuery.of(context).size.width,
                  h: 45.h,
                  colordata: ColorApp.primarycolor6),
            ],
          ),
        ),
      ),
    );
  }
}
