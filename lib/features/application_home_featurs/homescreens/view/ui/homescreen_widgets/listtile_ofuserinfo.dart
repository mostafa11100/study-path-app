import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget listtile_ofuserinfo({ontap, image, name}) {
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
        "hi$name",
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontWeight: FontWeight.w500),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 8.0, bottom: 0),
        child: Text(
          name,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      trailing: Icon(
        Icons.notification_important_outlined,
        size: 25.r,
      ),
      isThreeLine: false,
    );
  });
}
