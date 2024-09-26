import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/edittextfeild.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/text_feild_password_widget.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Change Password",
          style: TextStyleConst.textStyleconst22,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              Text(
                "To create a Secure Password:",
                style: TextStyleConst.textStyleconst18,
              ),
              SizedBox(
                height: 8.h,
              ),
              Text(
                '''8characters length
    2 letters in upper case
    1 special character (!@#\$&*)
    2 numerals (0-9)
    3 letters in lower case''',
                style: TextStyleConst.textStyleconst16!
                    .copyWith(color: ColorApp.neturalcolor9),
              ),
              SizedBox(
                height: 8.h,
              ),
              textfeildofpassword(
                security: true,
                label: "Old Passowrd",
                hint: "",
                controler: TextEditingController(),
              ),
              SizedBox(
                height: 8.h,
              ),
              textfeildofpassword(
                security: true,
                label: "New Passowrd",
                hint: "",
                controler: TextEditingController(),
              ),
              SizedBox(
                height: 8.h,
              ),
              textfeildofpassword(
                security: true,
                label: "Confirm Passowrd",
                hint: "",
                controler: TextEditingController(),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                  height: 42.h,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: ColorApp.primarycolor6),
                        onPressed: () {},
                        child: Text(
                          "Save Changes",
                          style: TextStyleConst.textStyleconst16!
                              .copyWith(color: Colors.white),
                        )),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
