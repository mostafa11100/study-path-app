import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycource_widgets/itemofrelated_course.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/cubit/cubit_get_courses/cubit/get_cources_cubit.dart';
import 'package:study_path/utilize/loading_circular.dart';

Widget relatedcourcesscreen({
  required String category,
}) {
  return BlocProvider(
    create: (context) => GetCourcesCubit()
      ..getcources(Filter('category', isEqualTo: "software")),
    child: BlocBuilder<GetCourcesCubit, GetCourcesState>(
      builder: (context, state) {
        if (state is GetCourcesSucces) {
          return ListView.builder(
              itemCount: state.cources.length,
              itemBuilder: (context, i) {
                return Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                    child:
                        itemofrelatedcource(context, () {}, state.cources[i]));
              });
        }
        if (state is GetCourcesFail) {
          return Center(
            child: Text("Oops ${state.error}"),
          );
        }
        return LoadingCircular();
      },
    ),
  );
}
