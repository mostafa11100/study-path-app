import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/coment_custom_widget.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/progress_ofslider.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/textfeild_custom_ofcoment.dart';

Widget bodyofreview({
  required List comments,
  dynamic context,
  required double excelent,
  required double verygood,
  required double good,
  required double poor,
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: progressSliderState(
            context: context,
            excelent: excelent,
            verygood: verygood,
            good: good,
            poor: poor,
          ),
        ),
        SliverList.builder(
            itemCount: 20,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0.h),
                child: ComentcustomWidget(
                    img:
                        "https://cdn.pixabay.com/photo/2016/11/29/13/14/attractive-1869761_1280.jpg",
                    time: "one houre",
                    title: "Mostafa",
                    review: 4.0,
                    coment:
                        "I am extremely satisfied with this product! It exceeded my expectations in terms of quality and performance. The attention to detail and the thought put into its design are impressive. It's user-friendly, durable, and a great value for the price. I would highly recommend it to anyone looking for something reliable and well-made!"),
              );
            }),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 30.h,
          ),
        ),
        SliverToBoxAdapter(
          child: CustomfeildOfComment(),
        )
      ],
    ),
  );
}
