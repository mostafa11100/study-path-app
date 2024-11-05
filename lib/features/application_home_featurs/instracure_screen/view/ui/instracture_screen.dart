import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycource_widgets/customtapbar.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/cubit/cubit/getinstracture_cubit.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/about_me_body.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/body_of_links.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/body_ofreview.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/cources_list.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen_widgets/user_listtile_info.dart';

class InstractureScreen extends StatefulWidget {
  const InstractureScreen({super.key, required this.uid});
  final String uid;
  @override
  State<InstractureScreen> createState() => _InstractureScreenState();
}

class _InstractureScreenState extends State<InstractureScreen>
    with TickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          GetinstractureCubit()..fetchinstracture(uid: widget.uid),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.white,
          leading: const Icon(
            Icons.arrow_back_ios,
            size: 24,
          ),
          backgroundColor: Colors.white,
          title: Text("Instracture",
              style: TextStyleConst.textStyleconst21!
                  .copyWith(fontWeight: FontWeight.bold)),
          centerTitle: true,
        ),
        body: BlocBuilder<GetinstractureCubit, GetinstractureState>(
          builder: (context, state) {
            if (state is Getinstracturefail) {
              return Center(
                child: Text(state.eror),
              );
            }

            if (state is Getinstracturesucces) {
              return SizedBox(
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
                                  user: false,
                                  name: state.model.instractureModel!.name,
                                  image: state.model.instractureModel!.photourl,
                                  ontap: () {},
                                  suptype: state.model.instractureModel!.bio),
                            ),
                            SliverToBoxAdapter(
                              child: SizedBox(
                                height: 20.h,
                              ),
                            ),
                            SliverToBoxAdapter(
                              child: coursesinstracture(
                                  context: context,
                                  courses: state.model.courseModel!,
                                  coursestitle: "My Courses"),
                            ),
                            SliverToBoxAdapter(
                                child: SizedBox(
                                    height: 60.h,
                                    width: MediaQuery.of(context).size.width,
                                    child: customtapBar(
                                        tabcont: tabController!,
                                        tabs: [
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
                                    comments: state.model.reviewmodel,
                                    excelent: .6,
                                    verygood: .4,
                                    good: .3,
                                    poor: .8,
                                    context: context)),
                            Center(
                                child: SizedBox(
                                    width: 125.w,
                                    child: bodyofsociallinks(
                                        model: state.model.instractureModel!,
                                        context: context))),
                            Aboutmebody(
                                aboutme:
                                    state.model.instractureModel!.aboutme!),
                          ],
                        )),
                  ));
            }

            return const Center(
              child: SizedBox(
                height: 20,
                width: 20,
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ),
    );
  }
}
