import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/functions/goroute_fun.dart';

Widget bodyofmore({context, required CourseModel model}) {
  return Padding(
    padding: EdgeInsets.only(bottom: 70.h),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        itemofbodymore(
            context: context,
            icondata: Icons.more_vert_outlined,
            label: "About This course",
            ontap: () {}),
        SizedBox(
          height: 10.h,
        ),
        itemofbodymore(
            context: context,
            icondata: Icons.workspace_premium,
            label: "course Certificate",
            ontap: () {}),
        SizedBox(
          height: 10.h,
        ),
        itemofbodymore(
            context: context,
            icondata: Icons.ios_share_outlined,
            label: "Share this course",
            ontap: () {}),
        SizedBox(
          height: 10.h,
        ),
        itemofbodymore(
            context: context,
            icondata: Icons.list_outlined,
            label: "Resources",
            ontap: () {
              GoRouter.of(context)
                  .push(Approuter.resourcesscreen, extra: model);
            }),
        SizedBox(
          height: 10.h,
        ),
        itemofbodymore(
            context: context,
            icondata: Icons.notifications,
            label: "Anonnencement",
            ontap: () {}),
      ],
    ),
  );
}

Widget itemofbodymore(
    {required BuildContext context,
    required IconData icondata,
    required String label,
    required Function() ontap}) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ListTile(
          onTap: ontap,
          horizontalTitleGap: 30.w,
          leading: Icon(
            icondata,
            size: 25.r,
            color: ColorApp.neturalcolor10,
          ),
          title: Text(
            label,
            style: TextStyleConst.textStyleconst15,
          ))
      //  Row(
      //   mainAxisAlignment: MainAxisAlignment.start,
      //   children: [
      //     Icon(
      //       icondata,
      //       size: 25.r,
      //       color: ColorApp.neturalcolor10,
      //     ),
      //     SizedBox(
      //       width: 25.w,
      //     ),
      //     Text(
      //       label,
      //       style: TextStyleConst.textStyleconst15,
      //     )
      //   ],
      // ),
      );
}
