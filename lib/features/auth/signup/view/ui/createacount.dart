import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/features/auth/signup/view/cubit/cubit/create_acount_cubit.dart';
import 'package:study_path/features/auth/signup/view/ui/create_widgets.dart/haveacount_or_login.dart';
import 'package:study_path/functions/goroute_fun.dart';
import 'package:study_path/functions/validations_functions/email_validation.dart';
import 'package:study_path/functions/validations_functions/empty_validate.dart';
import 'package:study_path/functions/validations_functions/password_validate.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/createacount_repos/abstract_repo.dart';
import 'package:study_path/utilize/custom_Button.dart';
import 'package:study_path/utilize/custom_dialog/loadingcircle_prog.dart';
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
      return true;
    } else {
      return false;
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
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text(
            S.of(context).CreateYourAcount,
            style: TextStyleConst.textStyleconst20!
                .copyWith(fontWeight: FontWeight.w800),
          ),
          centerTitle: true,
          leading: Icon(
            Icons.arrow_back_ios,
            size: 20.r,
          ),
        ),
        body: BlocProvider(
          create: (context) => CreateAcountCubit(CreateEmailAndPassowrd()),
          child: BlocListener<CreateAcountCubit, CreateAcountState>(
            listener: (context, state) {
              if (state is CreateAcountSuccess) {
                GoRouter.of(context).pop();
                // go  to page success
                GoR(
                  context: context,
                  name: Approuter.successcreateacountscreen,
                );
              } else if (state is CreateAcountFail) {
                GoRouter.of(context).pop();
                AwesomeDialog(
                  context: context,
                  dialogType: DialogType.error,
                  animType: AnimType.rightSlide,
                  title: 'error',
                  desc: state.error,
                  btnCancelOnPress: null,
                  btnOkOnPress: () {},
                ).show();
                //show alert dialog for error
              } else {
                showloadingdialog(context);
              }
            },
            child: Builder(builder: (context) {
              return Padding(
                padding: EdgeInsets.only(left: 20.w, right: 20.w, top: 65.h),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: SingleChildScrollView(
                    padding: EdgeInsets.zero,
                    child: SizedBox(
                      //  height: MediaQuery.of(context).size.height,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          // SizedBox(
                          //   height: 38.h,
                          // ),
                          Form(
                            key: formkey,
                            child: Column(
                              children: [
                                TextFeildCustom_Auth(
                                    controler: firstname,
                                    label: S.of(context).Firstname,
                                    validator: validateeifempty),
                                SizedBox(
                                  height: 27.h,
                                ),
                                TextFeildCustom_Auth(
                                  controler: lasttname,
                                  label: S.of(context).Lastname,
                                  validator: validateeifempty,
                                ),
                                SizedBox(
                                  height: 27.h,
                                ),
                                TextFeildCustom_Auth(
                                  controler: emailorphone,
                                  label: S.of(context).Emailorphonenumber,
                                  validator: (t) {
                                    String? emailv = emailvalidation(t);
                                    if (emailv == "email" ||
                                        emailv == "phone") {
                                    } else {
                                      return emailv;
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 27.h,
                                ),
                                PasswordTextfeild(
                                  controler: password,
                                  label: S.current.Password,
                                  validator: PasswordValidate,
                                ),
                                SizedBox(
                                  height: 27.h,
                                ),
                                PasswordTextfeild(
                                  controler: comfertpass,
                                  label: S.current.Comfertpassword,
                                  validator: (t) {
                                    if (password.text != t) {
                                      return "Please confirm the password";
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 60.h,
                                ),
                                CustomButtom(
                                    onpress: () {
                                      if (valid()) {
                                        BlocProvider.of<CreateAcountCubit>(
                                                context)
                                            .create(
                                                email: emailorphone.text,
                                                password: password.text,
                                                model: UserModel.tojson(
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
                                  height: 100.h,
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
              );
            }),
          ),
        ));
  }
}
