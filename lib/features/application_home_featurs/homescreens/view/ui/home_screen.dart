import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/category_list.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/courses_list.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/listtile_ofuserinfo.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/search_feild.dart';
import 'package:study_path/generated/l10n.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  String image =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvi7HpQ-_PMSMOFrj1hwjp6LDcI-jm3Ro0Xw&s";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25.h,
              ),
              listtile_ofuserinfo(name: "mostafa", image: image, ontap: () {}),
              SizedBox(
                height: 20.h,
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: searchfeildcustom(
                    context: context, filterontap: () {}, complete: () {}),
              ),
              SizedBox(
                height: 10.h,
              ),
              category(
                  listofcategory: [
                    "Bussines",
                    "software",
                    "enginerring",
                    "software",
                    "enginerring"
                  ],
                  ontap: (i) {
                    GoRouter.of(context)
                        .push(Approuter.categorydcreen, extra: "bussines");
                  }),
              SizedBox(
                height: 10.h,
              ),
              courses(
                  context: context,
                  courses: [
                    CourseModel(),
                    CourseModel(),
                    CourseModel(),
                    CourseModel()
                  ],
                  coursestitle: S.current.Offers)
            ],
          ),
        ),
      ),
    );
  }
}
