import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

// ignore: non_constant_identifier_names
Widget ComentcustomWidget({img, title, review, required String time, coment}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(img),
          radius: 27.r,
          backgroundColor: Colors.white,
        ),
        title: Text(
          title,
          style: TextStyleConst.textStyleconst15,
        ),
        subtitle: starreview(count: review),
        trailing: Padding(
          padding: EdgeInsets.only(top: 12.0.h, left: 3, right: 3),
          child: Text(
            "${time}m",
            style: TextStyleConst.textStyleconst11!
                .copyWith(color: ColorApp.neturalcolor12),
          ),
        ),
        isThreeLine: false,
      ),
      SizedBox(
        height: 10.h,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
        child: Text(
          coment,
          style: TextStyleConst.textStyleconst12!
              .copyWith(color: ColorApp.neturalcolor11),
        ),
      )
    ],
  );
}

Widget starreview({required double count}) {
  double countr = count;
  return Row(
    children: [
      Row(
        children: List.generate(5, (i) {
          countr -= 1;
          return Icon(
            Icons.star,
            color: countr < 0 ? ColorApp.neturalcolor9 : Colors.yellow[300],
            size: 18.r,
          );
        }),
      ),
      SizedBox(
        width: 4.w,
      ),
      Text(
        count.toString(),
        style: TextStyleConst.textStyleconst12,
      )
    ],
  );
}
