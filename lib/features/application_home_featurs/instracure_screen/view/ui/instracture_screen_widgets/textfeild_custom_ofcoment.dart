import 'package:flutter/material.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

// ignore: non_constant_identifier_names
Widget CustomfeildOfComment() {
  return TextField(
    decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primarycolor6),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primarycolor6),
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorApp.primarycolor6),
        ),
        hintText: "Write a review...",
        hintStyle: TextStyleConst.textStyleconst11!
            .copyWith(color: ColorApp.neturalcolor11)),
  );
}
