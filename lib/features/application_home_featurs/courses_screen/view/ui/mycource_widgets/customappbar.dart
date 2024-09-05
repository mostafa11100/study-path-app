import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycource_widgets/appbaritem.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycource_widgets/customtapbar.dart';

AppBar customappbar({
  required BuildContext context,
  required TabController tapcont,
}) {
  return AppBar(
    forceMaterialTransparency: true,
    leadingWidth: 66.w,
    leading: SizedBox(),
    backgroundColor: Colors.white,
    title: Text(
      "My Courses",
      style: TextStyleConst.textStyleconst21,
    ),
    centerTitle: true,
    bottom: PreferredSize(
        preferredSize: Size(MediaQuery.of(context).size.width,
            tapcont.index == 0 ? 220.h : 80.h),
        child: Padding(
          padding: EdgeInsets.all(0.0.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedSwitcher(
                  duration: Duration.zero,
                  child: tapcont.index == 0
                      ? Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: appbaritem(context),
                        )
                      : null),
              // SizedBox(
              //   height: 20.h,
              // ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: customtapBar(tapcont),
              )
            ],
          ),
        )),
  );
}
