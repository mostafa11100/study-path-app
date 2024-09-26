import 'package:flutter/material.dart';
import 'package:study_path/const/fontstyleconst.dart';

Widget Aboutmebody({required String aboutme}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Text(
      aboutme,
      style: TextStyleConst.textStyleconst14,
    ),
  );
}
