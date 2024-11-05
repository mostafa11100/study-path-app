import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/const/images_assets.dart';
import 'package:study_path/features/auth/forgetpassword/view/cubit/cubit/create_new_password_cubit.dart';
import 'package:study_path/functions/goroute_fun.dart';
import 'package:study_path/functions/validations_functions/password_validate.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/custom_Button.dart';
import 'package:study_path/utilize/custom_dialog/loadingcircle_prog.dart';
import 'package:study_path/utilize/custom_dialog/simpleawesam.dart';
import 'package:study_path/utilize/passwordtextfeild.dart';

class CreatenewpassowrdScreen extends StatelessWidget {
  CreatenewpassowrdScreen({super.key, required this.code});
  final String code;

  TextEditingController password = TextEditingController();

  TextEditingController comfertpass = TextEditingController();

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool? valid() {
    if (formkey.currentState != null) {
      return formkey.currentState!.validate();
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateNewPasswordCubit(),
      child: Builder(builder: (context) {
        return Scaffold(
            appBar: AppBar(
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
                "Forget password",
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headlineSmall!
                    .copyWith(fontWeight: FontWeight.w900),
              ),
            ),
            body: BlocListener<CreateNewPasswordCubit, CreateNewPasswordState>(
              listener: (context, state) {
                if (state is CreateNewPasswordLoading) {
                  showloadingdialog(context);
                }
                if (state is CreateNewPasswordSuccess) {
                  GoRouter.of(context).pop();
                  GoR(
                      context: context,
                      name: Approuter.successcreatenewpassword);
                }
                if (state is CreateNewPasswordFail) {
                  GoRouter.of(context).pop();
                  showerrordilog(context: context, message: state.error);
                }
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                          width: 220.h,
                          child: Image.asset(ImagesAssets.forgetpassword)),
                      SizedBox(
                        height: 30.h,
                      ),
                      Text(
                        S.current.CreatenewPassword,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(
                        height: 35.h,
                      ),
                      Form(
                          key: formkey,
                          child: Column(
                            children: [
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
                                    return S.current.Pleaseconfirmthepassword;
                                  }
                                },
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 25.h,
                      ),
                      CustomButtom(
                          onpress: () {
                            if (valid() == true) {
                              BlocProvider.of<CreateNewPasswordCubit>(context)
                                  .create(
                                      newpassword: password.text, code: code);
                            }
                            GoR(
                                context: context,
                                name: Approuter.createnewpassdone);
                          },
                          text: Text(
                            S.current.Submit,
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                          ),
                          w: MediaQuery.of(context).size.width,
                          h: 45.h,
                          colordata: ColorApp.primarycolor6),
                      SizedBox(
                        height: 60.h,
                      ),
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
                                        .copyWith(
                                            color: ColorApp.primarycolor6),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ));
      }),
    );
  }
}
