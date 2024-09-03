import 'package:flutter/material.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/functions/goroute_fun.dart';
import 'package:study_path/generated/l10n.dart';

Widget haveAcountorlogin() {
  return Builder(builder: (context) {
    return Row(
      children: [
        Text(
          S.current.Alreadyhaveacount,
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
                    .copyWith(color: ColorApp.primarycolor6),
              ),
            ],
          ),
        )
      ],
    );
  });
}
