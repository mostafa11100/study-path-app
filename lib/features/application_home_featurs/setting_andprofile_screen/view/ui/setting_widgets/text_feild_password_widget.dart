import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/textfeildeddit.dart';

Widget textfeildofpassword({label, hint, controler, security}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyleConst.textStyleconst14!
            .copyWith(color: ColorApp.neturalcolor9),
      ),
      SizedBox(
        height: 5.h,
      ),
      TextFeildCustom_editing(
        security: security,
        controler: controler,
        hint: hint,
      ),
    ],
  );
}
