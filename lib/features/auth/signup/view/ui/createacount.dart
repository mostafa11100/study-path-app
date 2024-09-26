import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/auth/signup/view/cubit/cubit/create_acount_cubit.dart';
import 'package:study_path/features/auth/signup/view/ui/create_widgets.dart/haveacount_or_login.dart';
import 'package:study_path/functions/validations_functions/email_validation.dart';
import 'package:study_path/functions/validations_functions/empty_validate.dart';
import 'package:study_path/functions/validations_functions/password_validate.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/createacount_repos/abstract_repo.dart';
import 'package:study_path/utilize/custom_Button.dart';
import 'package:study_path/utilize/passwordtextfeild.dart';
import 'package:study_path/utilize/textfeildcustom_auth.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class CreateacountScreen extends StatelessWidget {
  CreateacountScreen({super.key});

  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  bool valid() {
    if (formkey.currentState != null) {
      formkey.currentState!.validate();
      return false;
    } else {
      return true;
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
        body: BlocProvider(
      create: (context) => CreateAcountCubit(CreateEmailAndPassowrd()),
      child: BlocListener<CreateAcountCubit, CreateAcountState>(
        listener: (context, state) {
          if (state is CreateAcountSuccess) {
            GoRouter.of(context).pop();
            // go  to page success
          } else if (state is CreateAcountFail) {
            GoRouter.of(context).pop();
            AwesomeDialog(
              context: context,
              dialogType: DialogType.error,
              animType: AnimType.rightSlide,
              title: 'error',
              desc: state.error,
              btnCancelOnPress: null,
              btnOkOnPress: () {
                GoRouter.of(context).pop();
              },
            ).show();
            //show alert dialog for error
          } else {
            showDialog(
                context: context,
                builder: (context) {
                  return SizedBox(
                    height: 15.h,
                    width: 15.w,
                    child: const CircularProgressIndicator(),
                  );
                });
          }
        },
        child: SizedBox(
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
                                if (valid()) {
                                  BlocProvider.of<CreateAcountCubit>(context)
                                      .create(
                                          email: emailorphone.text,
                                          password: password.text,
                                          model: CreateUserDataModel.tojson(
                                              name: firstname.text,
                                              lastname: lasttname.text,
                                              email: emailorphone.text));
                                }
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
        ),
      ),
    ));
  }
}
