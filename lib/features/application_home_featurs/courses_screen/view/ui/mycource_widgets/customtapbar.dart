import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/generated/l10n.dart';

Widget customtapBar(TabController tabcont) {
  return TabBar(
      isScrollable: true,
      tabAlignment: TabAlignment.start,
      padding: EdgeInsets.zero,
      unselectedLabelColor: ColorApp.neturalcolor9,
      labelPadding: EdgeInsets.symmetric(horizontal: 20.w),
      dividerColor: ColorApp.neturalcolor7,
      indicatorColor: ColorApp.primarycolor6,
      labelColor: ColorApp.primarycolor6,
      labelStyle: TextStyleConst.textStyleconst17!
          .copyWith(color: ColorApp.neturalcolor9),
      unselectedLabelStyle: TextStyleConst.textStyleconst17!
          .copyWith(color: ColorApp.neturalcolor9),
      controller: tabcont,
      tabs: [
        Tab(
          text: S.current.All,
        ),
        Tab(
          text: S.current.Tracking,
        ),
        Tab(
          text: S.current.Relatedcources,
        ),
      ]);
}
