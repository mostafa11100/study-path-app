import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/generated/l10n.dart';

Widget category(
    {required List<String> listofcategory, required Function(int i) ontap}) {
  return Builder(builder: (context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 110.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              S.current.Category,
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(
            height: 55,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: listofcategory.length,
                itemBuilder: (context, i) {
                  return InkWell(
                    onTap: () {
                      ontap(i);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(4),
                      // width: 150.w,
                      padding: const EdgeInsets.all(3),
                      height: 50.h,
                      decoration: BoxDecoration(
                        border: Border.all(color: ColorApp.primarycolor6),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            listofcategory[i],
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    color: ColorApp.primarycolor6,
                                    fontWeight: FontWeight.w800),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  });
}
