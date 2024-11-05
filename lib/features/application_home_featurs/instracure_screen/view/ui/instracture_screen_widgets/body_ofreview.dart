import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/data/repos/getinstracture_cources.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/coment_custom_widget.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/progress_ofslider.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/textfeild_custom_ofcoment.dart';

Widget bodyofreview({
  required List<Reviewmodel> comments,
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
            itemCount: comments.length,
            itemBuilder: (context, i) {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 4.0.h),
                child: ComentcustomWidget(
                    img: comments[i].user.photourl,
                    time: comments[i].commint.time!.day.toString(),
                    title: comments[i].user.name,
                    review: 4.0,
                    coment: comments[i].commint.commint),
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
