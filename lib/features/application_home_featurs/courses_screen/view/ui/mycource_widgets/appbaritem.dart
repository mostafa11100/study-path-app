import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/const/images_assets.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/cubit/cubit_get_mycources/get_my_cources_cubit.dart';

Widget appbaritem({context, required List<MyCourcesModeldetails> model}) {
  int length = model.length;

  double value =
      length != 0 ? ((completedcoursecalculate(model)) / model.length) : 0;

  int coumplete = completedcoursecalculate(model);
  print("courcesss   ===#+#+#+#= $length  $value  $coumplete");
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
                  "${model.length} Cources You Pushed",
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
                      value: value.toDouble(),
                      min: 0,
                      max: 1,
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
                      "$length cources",
                      style: TextStyleConst.textStyleconst11!.copyWith(
                          color: ColorApp.neturalcolor9,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: 20.w,
                    ),
                    Text(
                      "$coumplete cources",
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

int completedcoursecalculate(List<MyCourcesModeldetails> models) {
  int allcousrces = 0;
  for (MyCourcesModeldetails v in models) {
    int? complete = v.coursedata!.complete;

    int? videos = v.courseAllDetails!.courseModel!.videos!.length;
    if (complete == videos) {
      allcousrces += 1;
    }
  }
  return allcousrces;
}
