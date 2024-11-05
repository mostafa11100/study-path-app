import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:msh_checkbox/msh_checkbox.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/utilize/custom_Button.dart';
import 'package:study_path/utilize/getcources_and_instracture/get_instracture_and_cources.dart';

class SuccessPayment extends StatelessWidget {
  const SuccessPayment({super.key, required this.coursemodel});
  final CourseAllDetails coursemodel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 100.0, horizontal: 30),
        child: Card(
            elevation: 4,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  MSHCheckbox(
                    size: 100,
                    value: true,
                    colorConfig: MSHColorConfig.fromCheckedUncheckedDisabled(
                      checkedColor: Colors.blue,
                    ),
                    style: MSHCheckboxStyle.stroke,
                    onChanged: (selected) {},
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Successful payment process",
                    style: TextStyleConst.textStyleconst14!
                        .copyWith(color: ColorApp.neturalcolor11),
                  ),
                  const SizedBox(
                    height: 80,
                  ),
                  Row(
                    children: [
                      Text(
                        "Title",
                        style: TextStyleConst.textStyleconst12!
                            .copyWith(color: ColorApp.neturalcolor10),
                      ),
                      const Spacer(),
                      Text(
                        coursemodel.courseModel!.title!,
                        style: TextStyleConst.textStyleconst12!
                            .copyWith(color: ColorApp.neturalcolor10),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Instracture",
                        style: TextStyleConst.textStyleconst12!
                            .copyWith(color: ColorApp.neturalcolor10),
                      ),
                      const Spacer(),
                      Text(
                        coursemodel.instractureModel!.name!,
                        style: TextStyleConst.textStyleconst12!
                            .copyWith(color: ColorApp.neturalcolor10),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Time",
                        style: TextStyleConst.textStyleconst12!
                            .copyWith(color: ColorApp.neturalcolor10),
                      ),
                      const Spacer(),
                      Text(
                        "${coursemodel.courseModel!.time}Hour",
                        style: TextStyleConst.textStyleconst12!
                            .copyWith(color: ColorApp.neturalcolor10),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(
                        "Price",
                        style: TextStyleConst.textStyleconst12!
                            .copyWith(color: ColorApp.neturalcolor10),
                      ),
                      const Spacer(),
                      Text(
                        "${coursemodel.courseModel!.price}\$",
                        style: TextStyleConst.textStyleconst12!
                            .copyWith(color: ColorApp.neturalcolor10),
                      ),
                    ],
                  ),
                  const Spacer(),
                  CustomButtom(
                      text: Text(
                        "Go TO Course",
                        style: TextStyleConst.textStyleconst13!
                            .copyWith(color: Colors.white),
                      ),
                      w: 140.w,
                      h: 45.h,
                      onpress: () {
                        GoRouter.of(context).pushReplacement(
                            Approuter.homescreenapp,
                            extra: coursemodel);
                      },
                      colordata: ColorApp.primarycolor6),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            )),
      ),
    ));
  }
}
