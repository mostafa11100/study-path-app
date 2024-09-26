import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/playlist_course_screen/view/ui/playlist_widgets/custom_appbar.dart';

Widget customsliverappBar(
    {required BuildContext context,
    required TabController tabcontroller,
    required String title,
    required String instracture}) {
  return SliverAppBar(
    backgroundColor: Colors.white,
    elevation: 0.0,
    surfaceTintColor: Colors.white,
    pinned: true,
    expandedHeight: MediaQuery.of(context).size.height / 6,
    flexibleSpace: FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      titlePadding: EdgeInsets.zero,
      expandedTitleScale: 1,
      title: customtapBarofcourse(tabcontroller),
      background: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Text(title, style: TextStyleConst.textStyleconst18),
          ),
          SizedBox(
            height: 6.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0.w),
            child: Text(instracture,
                style: TextStyleConst.textStyleconst15!
                    .copyWith(color: ColorApp.neturalcolor8)),
          ),
          SizedBox(
            height: 40.h,
          ),
        ],
      ),
    ),
  );
}
