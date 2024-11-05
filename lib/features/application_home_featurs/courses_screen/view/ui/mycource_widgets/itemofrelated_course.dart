import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/getcources_and_instracture/get_instracture_and_cources.dart';

Widget itemofrelatedcource(context, ontap, CourseAllDetails cources) {
  bool active = false;
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 0),
    child: SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: ColorApp.neturalcolor3),
              borderRadius: BorderRadius.circular(8.r),
            ),
            width: MediaQuery.of(context).size.width,
            height: 120.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 1.2,
                  child: Container(
                    //height: 150.h,

                    decoration: BoxDecoration(
                        color: ColorApp.neturalcolor2,
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(cources.courseModel!.coverurl!),
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
                    children: [
                      SizedBox(
                        height: 30,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                          // width: 120,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: Text(
                              cources.courseModel!.title!,
                              style: TextStyleConst.textStyleconst13!
                                  .copyWith(fontWeight: FontWeight.w800),
                            ),
                            trailing:
                                StatefulBuilder(builder: (context, setstate) {
                              return InkWell(
                                onTap: () {
                                  setstate(() {
                                    ontap();
                                    active = !active;
                                  });
                                },
                                child: Icon(
                                  Icons.favorite_outline,
                                  color: active == true
                                      ? ColorApp.primarycolor6
                                      : ColorApp.neturalcolor11,
                                ),
                              );
                            }),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        cources.instractureModel!.name!,
                        style: TextStyleConst.textStyleconst11!.copyWith(
                            color: ColorApp.neturalcolor9,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        cources.courseModel!.time!.toString(),
                        style: TextStyleConst.textStyleconst11!.copyWith(
                            color: ColorApp.neturalcolor11,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 7.w,
                      ),
                      Row(
                        children: [
                          Text(
                            cources.courseModel!.price!.toString(),
                            style: TextStyleConst.textStyleconst13!.copyWith(
                                color: ColorApp.neturalcolor9,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            cources.courseModel!.discount!.toString(),
                            style: TextStyleConst.textStyleconst13!.copyWith(
                                color: ColorApp.neturalcolor12,
                                fontWeight: FontWeight.w600),
                          ),
                          SizedBox(
                            width: 70.w,
                          ),
                          Text(
                            S.current.BuyNow,
                            style: TextStyleConst.textStyleconst11!.copyWith(
                              fontWeight: FontWeight.w900,
                              color: ColorApp.primarycolor6,
                              decoration: TextDecoration.underline,
                              decorationColor: ColorApp.primarycolor6,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 3.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "publeshed yesterday",
                  style: TextStyleConst.textStyleconst12!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: ColorApp.neturalcolor11),
                ),
                Icon(Icons.cloud_upload_outlined,
                    color: ColorApp.neturalcolor11)
              ],
            ),
          )
        ],
      ),
    ),
  );
}
