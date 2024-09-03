import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';

Widget searchfeildcustom({context, filterontap, complete}) {
  return SizedBox(
    height: 45.h,
    child: TextField(
      onEditingComplete: complete,
      decoration: InputDecoration(
          hintText: "search",
          hintStyle: Theme.of(context)
              .textTheme
              .labelMedium!
              .copyWith(color: ColorApp.neturalcolor10),
          contentPadding: const EdgeInsets.all(12),
          filled: true,
          isCollapsed: true,
          isDense: false,
          fillColor: ColorApp.neturalcolor1,
          prefixIcon: Icon(
            Icons.search_outlined,
            color: ColorApp.neturalcolor10,
          ),
          suffixIcon: InkWell(
            onTap: filterontap,
            child: Icon(
              Icons.tune_outlined,
              color: ColorApp.neturalcolor10,
            ),
          ),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(14.r))),
    ),
  );
}
