import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

Widget customtapBarofcourse(TabController tabcont) {
  return TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      padding: EdgeInsets.zero,
      unselectedLabelColor: ColorApp.neturalcolor9,
      labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
      dividerColor: ColorApp.neturalcolor7,
      indicatorColor: ColorApp.primarycolor6,
      labelColor: ColorApp.primarycolor6,
      labelStyle: TextStyleConst.textStyleconst15!
          .copyWith(color: ColorApp.neturalcolor8),
      unselectedLabelStyle: TextStyleConst.textStyleconst15!
          .copyWith(color: ColorApp.neturalcolor8),
      controller: tabcont,
      tabs: const [
        Tab(
          text: "Lectures",
        ),
        Tab(
          text: "More",
        ),
      ]);
}
