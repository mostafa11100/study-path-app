import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/generated/l10n.dart';

// ignore: non_constant_identifier_names
Widget DividerAndOrlogwith() {
  return Builder(builder: (context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          child: Divider(
            height: 80,
            color: ColorApp.neturalcolor10,
            thickness: 1,
            //indent: 0,
            //endIndent: MediaQuery.of(context).size.width / 2,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            S.current.orloginwith,
            style: TextStyleConst.textStyleconst15!
                .copyWith(fontSize: 14.sp, color: ColorApp.neturalcolor10),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width / 3.5,
          child: Divider(
            height: 80,
            color: ColorApp.neturalcolor10,
            thickness: 1,
            //indent: MediaQuery.of(context).size.width / 2,
            endIndent: 0,
          ),
        )
      ],
    );
  });
}
