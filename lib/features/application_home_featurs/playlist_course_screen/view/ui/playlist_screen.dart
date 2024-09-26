import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/playlist_course_screen/view/ui/playlist_widgets/body_ofmore.dart';
import 'package:study_path/features/application_home_featurs/playlist_course_screen/view/ui/playlist_widgets/custom_sliverappBar.dart';

import 'package:study_path/utilize/video_player.dart';

class PlayListScreen extends StatefulWidget {
  const PlayListScreen({super.key});

  @override
  State<PlayListScreen> createState() => _PlayListScreenState();
}

class _PlayListScreenState extends State<PlayListScreen>
    with TickerProviderStateMixin {
  ScrollController? controller;
  TabController? tabController;
  @override
  void initState() {
    controller = ScrollController();
    tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //  minimum: EdgeInsets.only(top: 10),
      child: Scaffold(
          body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            const VideoPlayer(
                url:
                    'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerFun.mp4'),
            Expanded(
              child: NestedScrollView(
                //   controller: controller,
                headerSliverBuilder: (context, b) {
                  return [
                    customsliverappBar(
                        context: context,
                        tabcontroller: tabController!,
                        title: "User research",
                        instracture: 'Brown')
                  ];
                },
                body: TabBarView(
                  controller: tabController,
                  children: [
                    CustomScrollView(
                      slivers: [
                        SliverList(
                            delegate: SliverChildBuilderDelegate(childCount: 50,
                                (context, i) {
                          return customListTileofcourse(
                              context: context,
                              image:
                                  "https://www.shutterstock.com/image-photo/elearning-education-internet-lessons-online-600nw-2158034833.jpg",
                              title: "User Research",
                              time: "10 minite");
                        }))
                      ],
                    ),
                    bodyofmore(context)
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

Widget customListTileofcourse(
    {required BuildContext context,
    required String image,
    required String title,
    required String time}) {
  return ListTile(
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
                image,
              ),
              fit: BoxFit.cover)),
      width: MediaQuery.of(context).size.width / 4.3,
      height: 60.h,
    ),
    title: Text(title,
        style: TextStyleConst.textStyleconst14!.copyWith(color: Colors.black)),
    subtitle: Text(time,
        style: TextStyleConst.textStyleconst12!
            .copyWith(color: ColorApp.neturalcolor8)),
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
