import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

Widget listtile_ofuserinfo({ontap, image, name, bio}) {
  //المفروض الاسم والصوره هيكونو ف موديل
  return Builder(builder: (context) {
    return ListTile(
      onTap: ontap,
      horizontalTitleGap: 5.h,
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(
        radius: 35.r,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(image),
      ),
      title: Text(
        "hi $name",
        style: TextStyleConst.textStyleconst16,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 4.0, bottom: 0),
        child: Text(
          bio,
          style: TextStyleConst.textStyleconst14!
              .copyWith(color: ColorApp.neturalcolor10),
        ),
      ),
      trailing: Icon(
        Icons.notifications_outlined,
        size: 25.r,
      ),
      isThreeLine: false,
    );
  });
}
