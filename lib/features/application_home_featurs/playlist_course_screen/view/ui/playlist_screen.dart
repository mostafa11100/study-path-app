import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pod_player/pod_player.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/playlist_course_screen/view/cubit/cubit/change_video_cubit.dart';
import 'package:study_path/features/application_home_featurs/playlist_course_screen/view/ui/playlist_widgets/body_ofmore.dart';
import 'package:study_path/features/application_home_featurs/playlist_course_screen/view/ui/playlist_widgets/custom_sliverappBar.dart';
import 'package:study_path/utilize/getcources_and_instracture/get_instracture_and_cources.dart';
import 'package:study_path/utilize/gineralmodels/video_model.dart';
import 'package:study_path/utilize/video_player.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({super.key, required this.courseAllDetails});
  final CourseAllDetails courseAllDetails;
  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen>
    with TickerProviderStateMixin {
  ScrollController? controller;
  TabController? tabController;

  PodPlayerController? videocon;
  @override
  void initState() {
    controller = ScrollController();
    videocon = PodPlayerController(
      playVideoFrom: PlayVideoFrom.network(
          widget.courseAllDetails.courseModel!.videos!.first.url!),
    )..initialise();
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  int selected = 0;
  bool pop = false;
  StreamController<bool> streamc = StreamController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //  minimum: EdgeInsets.only(top: 10),
      child: BlocProvider(
          create: (context) =>
              ChangeVideoCubit(widget.courseAllDetails.courseModel!.videos![0]),
          child: Scaffold(
              body: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: BlocBuilder<ChangeVideoCubit, ChangeVideoState>(
              builder: (context, state) {
                return Column(
                  children: [
                    VideoPlayercustom(
                      controller: videocon!,
                      url: '',
                    ),
                    Expanded(
                      child: NestedScrollView(
                        //   controller: controller,
                        headerSliverBuilder: (context, b) {
                          return [
                            customsliverappBar(
                                context: context,
                                tabcontroller: tabController!,
                                title: state.model!.title!,
                                instracture: widget
                                    .courseAllDetails.instractureModel!.name!,
                                uid: widget
                                    .courseAllDetails.instractureModel!.uid)
                          ];
                        },
                        body: TabBarView(
                          controller: tabController,
                          children: [
                            CustomScrollView(
                              slivers: [
                                SliverList(
                                    delegate: SliverChildBuilderDelegate(
                                        childCount: widget
                                            .courseAllDetails
                                            .courseModel!
                                            .videos!
                                            .length, (context, i) {
                                  return customListTileofcourse(
                                      slct: selected,
                                      ontap: () {
                                        setState(() {
                                          selected = i;
                                          print("ssll==$selected     $i");
                                          videocon?.changeVideo(
                                              playVideoFrom:
                                                  PlayVideoFrom.network(
                                                      state.model!.url!));

                                          BlocProvider.of<ChangeVideoCubit>(
                                                  context)
                                              .change(widget.courseAllDetails
                                                  .courseModel!.videos![i]);
                                        });
                                      },
                                      context: context,
                                      model: widget.courseAllDetails
                                          .courseModel!.videos![i],
                                      i: i);
                                }))
                              ],
                            ),
                            bodyofmore(
                                context: context,
                                model: widget.courseAllDetails.courseModel!)
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ))),
    );
  }
}

Widget customListTileofcourse(
    {required BuildContext context,
    required VideoModel model,
    required ontap,
    required i,
    required int slct}) {
  return ListTile(
    selectedTileColor: ColorApp.primarycolor1,
    selected: slct == i ? true : false,
    selectedColor: ColorApp.primarycolor1,
    onTap: ontap,
    visualDensity: const VisualDensity(
      vertical: 2,
      horizontal: 4,
    ),
    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
    horizontalTitleGap: 18.w,
    leading: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          image: DecorationImage(
              image: NetworkImage(
                model.coverurl!,
              ),
              fit: BoxFit.cover)),
      width: MediaQuery.of(context).size.width / 4.3,
      height: 60.h,
    ),
    title: Text(model.title!,
        style: TextStyleConst.textStyleconst14!.copyWith(color: Colors.black)),
    subtitle: Text("${5 * i + 5}m",
        style: TextStyleConst.textStyleconst13!
            .copyWith(color: ColorApp.neturalcolor9)),
    trailing: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Icon(
        Icons.play_circle,
        color: ColorApp.primarycolor6,
        size: 20.r,
      ),
    ),
  );
}
