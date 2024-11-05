import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/cubit/cubit_get_mycources/get_my_cources_cubit.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycource_widgets/itemofbody_ofcources.dart';
import 'package:pie_chart/pie_chart.dart';

class CourseSchedulaScreen extends StatelessWidget {
  const CourseSchedulaScreen({super.key, required this.model});
  final MyCourcesModeldetails model;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text(
            "Course Tracking",
            style: TextStyleConst.textStyleconst18,
          ),
          centerTitle: true,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: itemofcources(model: model),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20.h,
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: PieChart(
                      centerWidget: Text(
                        "80%",
                        style: TextStyleConst.textStyleconst16,
                      ),
                      ringStrokeWidth: 10,
                      chartLegendSpacing: 110,
                      dataMap: const {
                        "commposed task": 10,
                        "on progress task": 7,
                        'remoning task': 4
                      },
                      chartType: ChartType.ring,
                      baseChartColor: Colors.grey[50]!.withOpacity(0.15),
                      colorList: [
                        ColorApp.primarycolor6,
                        ColorApp.primarycolor5,
                        ColorApp.neturalcolor9
                      ],
                      chartValuesOptions: const ChartValuesOptions(
                          showChartValuesInPercentage: false,
                          showChartValues: false),
                      totalValue: 20,
                    ),
                  ),
                ),
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 20.h,
                  ),
                ),
                listoftasks(model.courseAllDetails!.courseModel!.tasks!)
              ],
            ),
          ),
        ));
  }
}

listoftasks(List tasks) {
  return SliverList.separated(
    itemBuilder: (context, i) {
      return itemoftasks(context, i + 1, tasks[i]);
    },
    separatorBuilder: (BuildContext context, int index) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Align(
            alignment: Alignment.centerLeft, child: divideroftasks(index)),
      );
    },
    itemCount: tasks.length,
  );
}

Widget itemoftasks(context, int i, task) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    child: Row(
      children: [
        CircleAvatar(
          radius: 12,
          backgroundColor:
              Colors.blue[(900 - i * 100) > 100 ? 900 - i * 100 : 100],
          child: const Center(
              child: Icon(
            Icons.done,
            size: 20,
            color: Colors.white,
          )),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          "Task $i (${task})",
          style: TextStyleConst.textStyleconst13,
        )
      ],
    ),
  );
}

Widget divideroftasks(int i) {
  return Container(
    height: 43,
    width: 4,
    color: Colors.blue[(900 - i * 100) > 100 ? 900 - i * 100 : 100],
  );
}
