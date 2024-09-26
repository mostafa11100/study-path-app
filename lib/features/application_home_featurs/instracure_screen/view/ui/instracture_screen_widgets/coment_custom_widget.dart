import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

// ignore: non_constant_identifier_names
Widget ComentcustomWidget({img, title, review, required String time, coment}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      ListTile(
        contentPadding: EdgeInsets.zero,
        leading: CircleAvatar(
          backgroundImage: NetworkImage(img),
          radius: 30.r,
          backgroundColor: Colors.white,
        ),
        title: Text(
          title,
          style: TextStyleConst.textStyleconst17,
        ),
        subtitle: starreview(count: review),
        trailing: Padding(
          padding: EdgeInsets.only(top: 12.0.h),
          child: Text(
            time,
            style: TextStyleConst.textStyleconst12!
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
            size: 19.r,
          );
        }),
      ),
      SizedBox(
        width: 4.w,
      ),
      Text(
        count.toString(),
        style: TextStyleConst.textStyleconst13,
      )
    ],
  );
}
