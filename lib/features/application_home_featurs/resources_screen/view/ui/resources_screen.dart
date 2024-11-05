import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/features/application_home_featurs/resources_screen/view/ui/resources_widgets/articles_body.dart';
import 'package:study_path/features/application_home_featurs/resources_screen/view/ui/resources_widgets/customtabBarofresources.dart';

class ResourcesScreen extends StatefulWidget {
  const ResourcesScreen({super.key, required this.model});
  final CourseModel model;
  @override
  State<ResourcesScreen> createState() => _ResourcesScreenState();
}

class _ResourcesScreenState extends State<ResourcesScreen>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            title: Text("Resources", style: TextStyleConst.textStyleconst20),
            centerTitle: true,
            bottom: PreferredSize(
                preferredSize: Size(MediaQuery.of(context).size.width, 50.h),
                child:
                    SafeArea(child: customtabBarofresources(tabController!)))),
        body: Padding(
          padding: EdgeInsets.all(15.w),
          child: TabBarView(controller: tabController, children: [
            articlesbody(
                resources: widget.model.listofarticles, context: context),
            articlesbody(resources: widget.model.listofbooks, context: context),
          ]),
        ));
  }
}
