import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

// ignore: non_constant_identifier_names
Widget Userlisttileinfo({ontap, image, name, suptype}) {
  //المفروض الاسم والصوره هيكونو ف موديل
  return Builder(builder: (context) {
    return ListTile(
      onTap: ontap,
      horizontalTitleGap: 5.h,
      minVerticalPadding: 0,
      contentPadding: const EdgeInsets.all(0),
      leading: CircleAvatar(
        radius: 38.r,
        backgroundColor: Colors.white,
        backgroundImage: NetworkImage(image),
      ),
      title: Text(
        name,
        style: TextStyleConst.textStyleconst20!,
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 3.0, bottom: 0),
        child: Text(
          suptype,
          style: TextStyleConst.textStyleconst13!
              .copyWith(color: ColorApp.neturalcolor9),
        ),
      ),
      trailing: Icon(
        Icons.notifications_none_rounded,
        size: 23.r,
      ),
      isThreeLine: false,
    );
  });
}
