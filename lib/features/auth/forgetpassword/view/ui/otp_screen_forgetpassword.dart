import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/auth/forgetpassword/view/cubit/cubit/check_code_verify_cubit.dart';
import 'package:study_path/features/auth/forgetpassword/view/cubit/cubit/sendverify_cubit.dart';
import 'package:study_path/features/auth/forgetpassword/view/ui/forgetpass_widgets/otp_widget.dart';
import 'package:study_path/functions/goroute_fun.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/custom_Button.dart';
import 'package:study_path/utilize/custom_dialog/loadingcircle_prog.dart';
import 'package:study_path/utilize/custom_dialog/simpleawesam.dart';

class OtpScreenForgetpassword extends StatelessWidget {
  OtpScreenForgetpassword({super.key, this.provider});
  String? provider;
  StreamController<String> streamController = StreamController<String>();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => SendverifyCubit(),
        ),
        BlocProvider(
          create: (context) => CheckCodeVerifyCubit(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          //  leadingWidth: 70,
          leading: Padding(
            padding: const EdgeInsets.only(left: 25),
            child: InkWell(
              onTap: () {
                GoRouter.of(context).pop();
              },
              child: const Icon(Icons.arrow_back_ios),
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            S.of(context).Forgetpassword,
            textAlign: TextAlign.center,
            style: TextStyleConst.textStyleconst22!
                .copyWith(fontWeight: FontWeight.w700),
          ),
        ),
        body: Builder(builder: (context) {
          return BlocListener<SendverifyCubit, SendverifyState>(
            listener: (context, state) {
              if (state is SendverifyLoading) {
                showloadingdialog(context);
              }
              if (state is SendverifySucces) {
                GoRouter.of(context).pop();
                GoR(context: context, name: Approuter.forgetpassword);
              }
              if (state is SendverifyFail) {
                GoRouter.of(context).pop();
                showerrordilog(context: context, message: state.error);
              }
            },
            child: BlocListener<CheckCodeVerifyCubit, CheckCodeVerifyState>(
              listener: (context, state) {
                if (state is CheckCodeVerifyLoading) {
                  showloadingdialog(context);
                }
                if (state is CheckCodeVerifySucces) {
                  GoRouter.of(context).pop();
                }
                if (state is CheckCodeVerifyFail) {
                  GoRouter.of(context).pop();
                  showerrordilog(context: context, message: state.error);
                }
              },
              child: SingleChildScrollView(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 36.h,
                        ),
                        SizedBox(
                          width: 250.w,
                          child: Text(
                            S.current.EnteryourverificationCode,
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        SizedBox(
                          height: 36.h,
                        ),
                        SizedBox(
                          width: 280.w,
                          child: Text(
                            S.current.sendedatextverificationcodetothephone,
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
                        otpcustomwidget(
                            context: context, streamcon: streamController),
                        SizedBox(
                          height: 60.h,
                        ),
                        StreamBuilder<String>(
                            stream: streamController.stream,
                            builder: (context, snapshot) {
                              return CustomButtom(
                                  onpress: snapshot.data == null
                                      ? null
                                      : () {
                                          BlocProvider.of<CheckCodeVerifyCubit>(
                                                  context)
                                              .checkcode(snapshot.data!);
                                        },
                                  text: Text(
                                    S.current.Verifycode,
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Colors.white),
                                  ),
                                  w: MediaQuery.of(context).size.width,
                                  h: 45.h,
                                  colordata: snapshot.data == null
                                      ? ColorApp.neturalcolor7
                                      : ColorApp.primarycolor6);
                            }),
                        SizedBox(
                          height: 20.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.current.Dontgetthecode,
                              style: Theme.of(context)
                                  .textTheme
                                  .labelSmall!
                                  .copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                            ),
                            InkWell(
                              onTap: () {
                                BlocProvider.of<SendverifyCubit>(context)
                                    .send(email: provider!);
                              },
                              child: Text(
                                S.current.Resendcode,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: ColorApp.primarycolor6,
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 100.h,
                        ),
                        Row(
                          children: [
                            Text(
                              S.current.IRemembermypassword,
                              style: Theme.of(context).textTheme.labelLarge!,
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
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelLarge!
                                        .copyWith(
                                            color: ColorApp.primarycolor6),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
/////
