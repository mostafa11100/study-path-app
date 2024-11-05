import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycources_screen.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/repos/getuserrepos/abstractepo.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/cubit/cubit/get_user_info_cubit.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/home_screen.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_screen.dart';
import 'package:study_path/features/application_home_featurs/wishlist_screen/view/ui/my_wishlst_screen.dart';

class HomeScreenApp extends StatefulWidget {
  HomeScreenApp({super.key});

  @override
  State<HomeScreenApp> createState() => _HomeScreenAppState();
}

class _HomeScreenAppState extends State<HomeScreenApp>
    with SingleTickerProviderStateMixin {
  List<TabItem> items = [
    const TabItem(
      icon: Icons.home_outlined,
      title: '',
    ),
    const TabItem(
      icon: Icons.import_contacts_outlined,
      title: '',
    ),
    const TabItem(
      icon: Icons.favorite_border_outlined,
      title: '',
    ),
    const TabItem(
      icon: Icons.settings_outlined,
      title: '',
    ),
  ];

  int visit = 0;
  TabController? controller;
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetUserInfoCubit(GetUserFromFirebasee())..getdata(),
      child: Scaffold(
        body: BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
          builder: (context, state) {
            if (state is GetUserInfoSuccess) {
              return TabBarView(controller: controller, children: [
                HomeScreen(user: state.user),
                MycourcesScreen(user: state.user),
                MyWishlistScreen(user: state.user),
                SettingScreen(user: state.user)
              ]);
            }
            if (state is GetUserInfoFail) {
              return Center(
                child: Text(
                  state.error,
                  style: TextStyleConst.textStyleconst15,
                ),
              );
            }
            return const SizedBox();
          },
        ),
        bottomNavigationBar: BottomBarDefault(
          // height: 60,
          items: items,
          iconSize: 27,
          // padTop: 0,
          // padbottom: 0,
          pad: 0,
          boxShadow: [
            BoxShadow(
                color: ColorApp.primarycolor6, blurRadius: .1, spreadRadius: .0)
          ],
          backgroundColor: Colors.white,
          color: Colors.black,
          colorSelected: ColorApp.primarycolor6,
          indexSelected: visit,
          onTap: (int index) => setState(() {
            visit = index;
            controller!.animateTo(index);
          }),
          // chipStyle: const ChipStyle(convexBridge: true),
          // itemStyle: ItemStyle.circle,
          animated: false,
        ),
      ),
    );
  }
}
