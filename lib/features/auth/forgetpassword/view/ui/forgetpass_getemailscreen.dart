import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/class/firebase/verify/sendverify_email.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/const/images_assets.dart';
import 'package:study_path/features/auth/forgetpassword/view/cubit/cubit/sendverify_cubit.dart';
import 'package:study_path/functions/goroute_fun.dart';
import 'package:study_path/functions/validations_functions/email_validation.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/custom_Button.dart';
import 'package:study_path/utilize/custom_dialog/loadingcircle_prog.dart';
import 'package:study_path/utilize/custom_dialog/simpleawesam.dart';
import 'package:study_path/utilize/textfeildcustom_auth.dart';

class ForgetpassSendcodeScreen extends StatelessWidget {
  ForgetpassSendcodeScreen({super.key});
  TextEditingController controller = TextEditingController();
  GlobalKey<FormState> formkey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SendverifyCubit(),
      child: Scaffold(
          body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Builder(builder: (context) {
          return SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width - 50,
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        ImagesAssets.forgetpassword,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 110.h,
                  ),
                  Text(
                    "Verification code to your email",
                    style: TextStyleConst.textStyleconst17!
                        .copyWith(color: ColorApp.neturalcolor11),
                  ),
                  Text(
                    "We will send verification code to yor email",
                    style: TextStyleConst.textStyleconst15!
                        .copyWith(color: ColorApp.neturalcolor11),
                  ),
                  SizedBox(
                    height: 50.h,
                  ),
                  Form(
                    key: formkey,
                    child: TextFeildCustom_Auth(
                        controler: controller,
                        hint: " Enter Your email",
                        validator: emailvalidation),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  BlocListener<SendverifyCubit, SendverifyState>(
                    listener: (context, state) {
                      if (state is SendverifySucces) {
                        GoRouter.of(context).canPop();
                        showesuccesdialog(
                            context: context,
                            ontap: () {
                              print("sign in");
                              GoRouter.of(context).push(Approuter.signin,
                                  extra: controller.text);
                            },
                            message:
                                "We are sended email to gmail please check your email and change your password");
                      } else if (state is SendverifyFail) {
                        GoRouter.of(context).canPop();
                        showerrordilog(context: context, message: state.error);
                      } else {
                        showloadingdialog(context);
                      }
                    },
                    child: CustomButtom(
                        onpress: () {
                          if (formkey.currentState!.validate()) {
                            SendverifyEmail.sendcodetoemail(
                                email: controller.text);
                            // send verify code
                            BlocProvider.of<SendverifyCubit>(context)
                                .send(email: controller.text);
                            // go to check code
                          }
                        },
                        text: Text(
                          "Send Verify",
                          style: TextStyleConst.textStyleconst13!
                              .copyWith(color: Colors.white),
                        ),
                        w: MediaQuery.of(context).size.width / 1.2,
                        h: 50.h,
                        colordata: ColorApp.primarycolor6),
                  )
                ],
              ),
            ),
          );
        }),
      )),
    );
  }
}
