import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

Widget itemofcources(context) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 140.h,
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          AspectRatio(
            aspectRatio: 1.2,
            child: Container(
              //height: 150.h,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.r),
                  image: const DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSVukrmVSypMEscsW83Ab4Yax36AgUSov1pPw&s"),
                  )),
            ),
          ),
          SizedBox(
            width: 20.w,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0.r),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Programming",
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
                  height: 4.h,
                  child: SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 5.r), // يمكنك تعديل الحجم هنا
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
        ],
      ),
    ),
  );
}
