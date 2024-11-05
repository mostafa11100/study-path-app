import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/getcources_and_instracture/get_instracture_and_cources.dart';

Widget wishlistitem(
    {context, ontap, required CourseAllDetails model, bool active = false}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 7.0.h, horizontal: 10),
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
                  aspectRatio: 1.1,
                  child: Container(
                    //height: 150.h,

                    decoration: BoxDecoration(
                        color: ColorApp.neturalcolor3,
                        borderRadius: BorderRadius.circular(8.r),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(model.courseModel!.coverurl!),
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
                              model.courseModel!.title!,
                              style: TextStyleConst.textStyleconst14!
                                  .copyWith(fontWeight: FontWeight.w800),
                            ),
                            trailing:
                                StatefulBuilder(builder: (context, setstate) {
                              return InkWell(
                                onTap: () {
                                  setstate(() {
                                    active = !active;
                                  });
                                },
                                child: Icon(
                                  active == true
                                      ? Icons.favorite_rounded
                                      : Icons.favorite_outline,
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
                        model.instractureModel!.name!,
                        style: TextStyleConst.textStyleconst12!.copyWith(
                            color: ColorApp.neturalcolor9,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        model.courseModel!.time!.toString(),
                        style: TextStyleConst.textStyleconst12!.copyWith(
                            color: ColorApp.neturalcolor11,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 7.w,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2.2,
                        child: Row(
                          children: [
                            Text(
                              model.courseModel!.price!.toString(),
                              style: TextStyleConst.textStyleconst13!.copyWith(
                                  color: ColorApp.neturalcolor9,
                                  fontWeight: FontWeight.w600,
                                  decoration: TextDecoration.lineThrough),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              model.courseModel!.discount.toString(),
                              style: TextStyleConst.textStyleconst13!.copyWith(
                                  color: ColorApp.neturalcolor12,
                                  fontWeight: FontWeight.w600),
                            ),
                            const Spacer(),
                            Text(
                              S.current.BuyNow,
                              style: TextStyleConst.textStyleconst13!.copyWith(
                                  fontWeight: FontWeight.w900,
                                  color: ColorApp.primarycolor6,
                                  decoration: TextDecoration.underline,
                                  decorationColor: ColorApp.primarycolor6),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
