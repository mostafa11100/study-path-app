import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycource_widgets/customtapbar.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/courses_list.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/about_me_body.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/body_of_links.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/body_ofreview.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/user_listtile_info.dart';

class InstractureScreen extends StatefulWidget {
  const InstractureScreen({super.key});

  @override
  State<InstractureScreen> createState() => _InstractureScreenState();
}

class _InstractureScreenState extends State<InstractureScreen>
    with TickerProviderStateMixin {
  String image =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTvi7HpQ-_PMSMOFrj1hwjp6LDcI-jm3Ro0Xw&s";

  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        leading: const Icon(Icons.arrow_back_ios),
        backgroundColor: Colors.white,
        title: Text("Instracture", style: TextStyleConst.textStyleconst22),
        centerTitle: true,
      ),
      body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: NestedScrollView(
                headerSliverBuilder: (context, b) {
                  return [
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10.h,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Userlisttileinfo(
                          name: "mostafa",
                          image: image,
                          ontap: () {},
                          suptype: "ui/ux designer"),
                    ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 20.h,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: courses(
                          context: context,
                          courses: [
                            CourseModel(),
                            CourseModel(),
                            CourseModel(),
                            CourseModel()
                          ],
                          coursestitle: "My Courses"),
                    ),
                    SliverToBoxAdapter(
                        child: SizedBox(
                            height: 60.h,
                            width: MediaQuery.of(context).size.width,
                            child: customtapBar(tabcont: tabController!, tabs: [
                              const Tab(
                                text: "Reviews",
                              ),
                              const Tab(
                                text: "Social Links",
                              ),
                              const Tab(
                                text: "about me",
                              ),
                            ])))
                  ];
                },
                body: TabBarView(
                  controller: tabController,
                  children: [
                    Container(
                        child: bodyofreview(
                            comments: [],
                            excelent: .6,
                            verygood: .4,
                            good: .3,
                            poor: .8,
                            context: context)),
                    Center(
                        child: SizedBox(
                            width: 125.w,
                            child: bodyofsociallinks(
                                links: [], context: context))),
                    Aboutmebody(
                        aboutme:
                            '''Reloaded 0 libraries in 2,680ms (compile: 186 ms, reload: 0 ms, reassemble: 999 ms).
Reloaded 1 of 1975 libraries in 3,999ms (compile: 160 ms, reload: 1341 ms, reassemble: 1669 ms).
Reloaded 0 libraries in 1,826ms (compile: 121 ms, reload: 0 ms, reassemble: 718 ms).
Reloaded 1 of 1975 libraries in 4,653ms (compile: 114 ms, reload: 1538 ms, reassemble: 2306 ms).
Reloaded 0 libraries in 1,466ms (compile: 86 ms, reload: 0 ms, reassemble: 722 ms).'''),
                  ],
                )),
          )),
    );
  }
}
