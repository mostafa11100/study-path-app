import 'package:awesome_bottom_bar/widgets/inspired/inspired.dart';
import 'package:flutter/material.dart';
import 'package:awesome_bottom_bar/awesome_bottom_bar.dart';
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
    return Scaffold(
      body: TabBarView(controller: controller, children: [
        HomeScreen(),
        Container(
          color: Colors.blue,
        ),
        const MyWishlistScreen(),
        const SettingScreen()
      ]),
      bottomNavigationBar: BottomBarInspiredInside(
        height: 60,
        items: items,
        iconSize: 25,
        padTop: 0,
        padbottom: 0,
        pad: 0,
        backgroundColor: Colors.white,
        color: Colors.black,
        colorSelected: Colors.white,
        indexSelected: visit,
        onTap: (int index) => setState(() {
          visit = index;
          controller!.animateTo(index);
        }),
        chipStyle: const ChipStyle(convexBridge: true),
        itemStyle: ItemStyle.circle,
        animated: false,
      ),
    );
  }
}
