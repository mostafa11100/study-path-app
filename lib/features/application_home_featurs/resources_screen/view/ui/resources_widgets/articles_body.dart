import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

Widget articlesbody(
    {required List listofarticles, required BuildContext context}) {
  return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 12.0),
          child: itemofarticle(
              context: context,
              title: 'The element of user experince',
              name: 'By of john',
              info: 'This article provided by antynous',
              ontap: () {}),
        );
      });
}

Widget itemofarticle(
    {required BuildContext context,
    required String title,
    required String name,
    required String info,
    required Function() ontap}) {
  return InkWell(
    onTap: ontap,
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 3.5.r,
                backgroundColor: ColorApp.neturalcolor7,
              ),
              SizedBox(
                width: 12.w,
              ),
              Text(
                title,
                style: TextStyleConst.textStyleconst15,
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Icon(
                  Icons.arrow_forward_ios_outlined,
                  size: 20.r,
                ),
              )
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                name,
                style: TextStyleConst.textStyleconst13!
                    .copyWith(color: ColorApp.neturalcolor9),
              ),
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: Text(
                info,
                style: TextStyleConst.textStyleconst13!
                    .copyWith(color: ColorApp.neturalcolor9),
              ),
            ),
          ),
        ],
      ),
    ),
  );
}