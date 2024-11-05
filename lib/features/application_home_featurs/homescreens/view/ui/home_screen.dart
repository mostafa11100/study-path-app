import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/cubit/cubit_get_courses/cubit/get_cources_cubit.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/category_list.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/courses_list.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/listtile_ofuserinfo.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/search_feild.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/loading_circular.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.user});
  final UserModel user;

  final List<String> categorys = [
    "bussnies",
    "software",
    "enginerring",
    "software",
    "enginerring"
  ];
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetCourcesCubit()..getcources(Filter('discount', isGreaterThan: 0)),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Builder(builder: (context) {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 35.h,
                  ),
                  listtile_ofuserinfo(
                      bio: user.bio,
                      name: user.name,
                      image: user.photourl,
                      ontap: () {}),
                  SizedBox(
                    height: 20.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: searchfeildcustom(
                        context: context, filterontap: () {}, complete: () {}),
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  category(
                      listofcategory: categorys,
                      ontap: (i) {
                        GoRouter.of(context)
                            .push(Approuter.categorydcreen, extra: "bussnies");
                      }),
                  SizedBox(
                    height: 20.h,
                  ),
                  BlocBuilder<GetCourcesCubit, GetCourcesState>(
                    builder: (context, state) {
                      if (state is GetCourcesSucces) {
                        return courses(
                            context: context,
                            courses: state.cources,
                            coursestitle: S.current.Offers);
                      } else if (state is GetCourcesFail) {
                        return const Text("Oops   please try again");
                      }
                      return LoadingCircular();
                    },
                  )
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
