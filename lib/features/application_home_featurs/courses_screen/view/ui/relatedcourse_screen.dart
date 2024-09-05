import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/generated/l10n.dart';

Widget relatedcourcesscreen() {
  return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, i) {
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0.w),
          child: itemofrelatedcource(context, CourseModel(), () {}),
        );
      });
}

Widget itemofrelatedcource(context, coursemodel, ontap) {
  bool active = false;
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
                    children: [
                      SizedBox(
                        height: 30,
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width / 2.2,
                          // width: 120,
                          child: ListTile(
                            contentPadding: const EdgeInsets.all(0),
                            leading: Text(
                              coursemodel.coursename!,
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
                        coursemodel.instracure!,
                        style: TextStyleConst.textStyleconst11!.copyWith(
                            color: ColorApp.neturalcolor9,
                            fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      Text(
                        coursemodel.time!,
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
                            coursemodel.price!,
                            style: TextStyleConst.textStyleconst13!.copyWith(
                                color: ColorApp.neturalcolor9,
                                fontWeight: FontWeight.w600,
                                decoration: TextDecoration.lineThrough),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            coursemodel.descaond!,
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
                                decoration: TextDecoration.underline),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "publeshed yesterday",
                style: TextStyleConst.textStyleconst13!
                    .copyWith(fontWeight: FontWeight.w500),
              ),
              Icon(Icons.cloud_upload_outlined)
            ],
          )
        ],
      ),
    ),
  );
}
