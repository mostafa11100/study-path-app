import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/images_assets.dart';

showchoicepayment(context) {
  showBottomSheet(
      elevation: 5,
      context: context,
      builder: (context) {
        return Container(
          //height: 250.h,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(10.w),
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30), topRight: Radius.circular(30))),
          child: Row(
            children: [
              InkWell(
                onTap: () {},
                child: Container(
                    height: 60.h,
                    width: 68.w,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              ImagesAssets.paypal,
                            ),
                            fit: BoxFit.cover),
                        border: Border.all(
                          color: ColorApp.primarycolor6,
                        ),
                        borderRadius: BorderRadius.circular(8))),
              ),
              SizedBox(
                width: 20.w,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.all(10),
                    height: 60.h,
                    width: 68.w,
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorApp.primarycolor6,
                        ),
                        image: DecorationImage(
                            image: AssetImage(
                              ImagesAssets.stripe,
                            ),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(8))),
              ),
            ],
          ),
        );
      });
}
