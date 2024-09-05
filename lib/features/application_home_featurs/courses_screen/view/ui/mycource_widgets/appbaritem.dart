import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/const/images_assets.dart';

Widget appbaritem(context) {
  return Container(
      padding: EdgeInsets.all(15.w),
      height: 130.h,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
          color: ColorApp.primarycolor3,
          borderRadius: BorderRadius.circular(12.r)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "12 Cources You Pushed",
                  style: TextStyleConst.textStyleconst13!
                      .copyWith(fontWeight: FontWeight.w700),
                ),
                Text(
                  "completed course",
                  style: TextStyleConst.textStyleconst11!.copyWith(
                      color: ColorApp.neturalcolor9,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 6.h,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 6.r), // يمكنك تعديل الحجم هنا
                      overlayShape: const RoundSliderOverlayShape(
                          overlayRadius:
                              .01), // يمكنك تعديل حجم الـ overlay هنا
                    ),
                    child: Slider(
                      activeColor: ColorApp.primarycolor6,
                      thumbColor: ColorApp.primarycolor6,
                      value: 70,
                      min: 0,
                      max: 100,
                      onChanged: (newValue) {
                        // setState(() {
                        //   _sliderValue = newValue;
                        // });
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "9cources",
                      style: TextStyleConst.textStyleconst11!.copyWith(
                          color: ColorApp.neturalcolor9,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "3cources",
                      style: TextStyleConst.textStyleconst11!.copyWith(
                          color: ColorApp.neturalcolor9,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Image(
                fit: BoxFit.cover, image: AssetImage(ImagesAssets.svg_girl)),
          )
        ],
      ));
}
