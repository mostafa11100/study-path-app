import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/const/images_assets.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/data/models/instracturemodel.dart';

Widget bodyofsociallinks({required InstractureModel model, context}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: ListView.builder(
        itemCount: model.socialMediamodel!.listoflinks.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: socailmedia(
                ontap: () {
                  //go to links
                  //model.socialMediamodel!.listoflinks[i]..link
                },
                type: model.socialMediamodel!.listoflinks[i].type),
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
          const Spacer(),
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
        const Spacer(),
        Text(
          "FaceBook",
          style: TextStyleConst.textStyleconst16,
        ),
      ],
    );
  }
  return null;
}

// ignore: camel_case_types, constant_identifier_names
enum socialmediatype { FaceBook, Linkedin }
