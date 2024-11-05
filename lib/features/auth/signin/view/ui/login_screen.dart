// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/const/images_assets.dart';
import 'package:study_path/features/auth/signin/view/cubit/cubit/signin_cubit.dart';
import 'package:study_path/features/auth/signin/view/ui/login_widgets/divider_andtext.dart';
import 'package:study_path/features/auth/signin/view/ui/login_widgets/remember_andforgetpass.dart';
import 'package:study_path/functions/goroute_fun.dart';
import 'package:study_path/functions/validations_functions/email_validation.dart';
import 'package:study_path/functions/validations_functions/password_validate.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/createacount_repos/abstract_repo.dart';
import 'package:study_path/utilize/custom_dialog/loadingcircle_prog.dart';
import 'package:study_path/utilize/custom_dialog/simpleawesam.dart';
import 'package:study_path/utilize/custom_Button.dart';
import 'package:study_path/utilize/passwordtextfeild.dart';
import 'package:study_path/utilize/textfeildcustom_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController? email;

  GlobalKey<FormState>? formkey;

  TextEditingController? passwordcon;

  bool checkval = false;

  @override
  void initState() {
    formkey = GlobalKey();
    email = TextEditingController();
    passwordcon = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    email!.dispose();
    passwordcon!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              surfaceTintColor: Colors.white,
              title: Text(
                S.of(context).Welcomeback,
                style: TextStyleConst.textStyleconst21!
                    .copyWith(fontWeight: FontWeight.w900),
              ),
              centerTitle: true,
              leading: Icon(
                Icons.arrow_back_ios,
                size: 20.r,
              ),
            ),
            body: BlocListener<SigninCubit, SigninState>(
              listener: (context, state) {
                if (state is SigninSucces) {
                  GoRouter.of(context).pop();

                  GoR(context: context, name: Approuter.homescreenapp);
                }
                if (state is SigninFail) {
                  GoRouter.of(context).pop();
                  showerrordilog(message: state.error, context: context);
                } else if (state is SigninNotverify) {
                  GoRouter.of(context).pop();
                  showerrordilog(message: state.text, context: context);
                } else if (state is SigninLoading) {
                  showloadingdialog(context);
                }
              },
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 5, bottom: 10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).LogIntoyouracount,
                        style: TextStyleConst.textStyleconst16!
                            .copyWith(color: ColorApp.neturalcolor11),
                      ),
                      SizedBox(
                        height: 75.h,
                      ),
                      Form(
                          key: formkey,
                          child: Column(
                            children: [
                              TextFeildCustom_Auth(
                                  controler: email,
                                  label: S.current.Emailorphonenumber,
                                  validator: (t) {
                                    String? validd = emailvalidation(t);
                                    if (validd != "phone" &&
                                        validd != "email") {
                                      return validd;
                                    }
                                    return null;
                                  })
                            ],
                          )),
                      SizedBox(
                        height: 25.h,
                      ),
                      PasswordTextfeild(
                          label: S.current.Password,
                          validator: PasswordValidate,
                          controler: passwordcon),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                        children: [
                          rememberandforgetpassword(),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            child: Text(
                              S.current.rememberme,
                              style: TextStyleConst.textStyleconst11!.copyWith(
                                  color: ColorApp.neturalcolor10,
                                  fontSize: 12.sp),
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            onTap: () {
                              GoR(
                                  context: context,
                                  name: Approuter.sendcoderesetscreen);
                            },
                            child: Text(
                              S.current.Forgetpassword,
                              style: TextStyleConst.textStyleconst13!.copyWith(
                                  color: ColorApp.primarycolor6,
                                  fontSize: 12.sp),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      CustomButtom(
                          onpress: () {
                            if (formkey!.currentState!.validate()) {
                              BlocProvider.of<SigninCubit>(context)
                                  .signinwithemailandpass(
                                      email: email!.text,
                                      password: passwordcon!.text);
                            }
                          },
                          text: Text(
                            "Login",
                            style: TextStyleConst.textStyleconst16!
                                .copyWith(color: Colors.white),
                          ),
                          w: MediaQuery.of(context).size.width,
                          h: 47.h,
                          colordata: ColorApp.primarycolor6),
                      SizedBox(
                        height: 5.h,
                      ),
                      DividerAndOrlogwith(),
                      SizedBox(
                        height: 25.h,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            sociallogin(ImagesAssets.facebook, () {
                              BlocProvider.of<SigninCubit>(context)
                                  .signin(signinprovider: Createfacebookauth());
                            }),
                            sociallogin(ImagesAssets.googleimage, () {
                              BlocProvider.of<SigninCubit>(context)
                                  .signin(signinprovider: Creategoogleauth());
                            }),
                            sociallogin(ImagesAssets.linedin, () {}),
                          ]),
                      SizedBox(
                        height: 98.h,
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 3.w, vertical: 0),
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
                                        .copyWith(
                                            color: ColorApp.primarycolor6),
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
              ),
            ));
      }),
    );
  }
}

sociallogin(url, ontap) {
  return SizedBox(
      width: 30.w,
      height: 30.h,
      child: InkWell(
        onTap: ontap,
        child: Image.asset(url),
      ));
}
