import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/const/images_assets.dart';

Widget bodyofsociallinks({required List links, context}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
        itemCount: 4,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: socailmedia(
                ontap: () {},
                type: i % 2 == 0
                    ? socialmediatype.FaceBook
                    : socialmediatype.Linkedin),
          );
        }),
  );
}

Widget? socailmedia({ontap, socialmediatype? type}) {
  if (type == socialmediatype.Linkedin) {
    return InkWell(
      onTap: ontap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 30.h,
            height: 30.h,
            child: Image.asset(ImagesAssets.linedin),
          ),
          Spacer(),
          Text(
            "Linkedin",
            style: TextStyleConst.textStyleconst16,
          ),
        ],
      ),
    );
  } else if (type == socialmediatype.FaceBook) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 30.h,
          height: 30.h,
          child: Image.asset(ImagesAssets.facebook),
        ),
        Spacer(),
        Text(
          "FaceBook",
          style: TextStyleConst.textStyleconst16,
        ),
      ],
    );
  }
  return null;
}

enum socialmediatype { FaceBook, Linkedin }
