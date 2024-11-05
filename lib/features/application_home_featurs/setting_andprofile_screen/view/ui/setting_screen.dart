import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/item_with_switch.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/itemofsetting_simple.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/litemofprofile.dart';
import 'package:study_path/functions/goroute_fun.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key, required this.user});
  final UserModel user;
  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool darkmodel = false;
  bool notfication = false;
  @override
  void initState() {
    notfication = widget.user.notfication!;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: const SizedBox(),
          centerTitle: true,
          title: Text(
            "Settings",
            style: TextStyleConst.textStyleconst21,
          ),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 22.h,
            ),
            customlisttile_ofprofile(
                ontap: () {
                  GoRouter.of(context)
                      .push(Approuter.profilescreen, extra: widget.user);
                },
                img: widget.user.photourl,
                title: widget.user.name,
                subtitle: widget.user.email),
            SizedBox(
              height: 35.h,
            ),
            itemofsettingsscreenwithswich(
              leadingicondata: Icons.dark_mode_outlined,
              text: 'Dark mode',
              active: darkmodel,
              setstate: (bool val) {
                setState(() {
                  darkmodel = val;
                });
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            itemofsettingsscreenwithswich(
              leadingicondata: Icons.notifications_outlined,
              text: 'Notfications',
              active: notfication,
              setstate: (bool val) {
                setState(() {
                  notfication = val;
                });
              },
            ),
            SizedBox(
              height: 10.h,
            ),
            itemofsettingsscreen(
                leadingicondata: Icons.privacy_tip_outlined,
                text: "Privacy",
                trailing: Icons.arrow_forward_ios,
                ontap: () {}),
            SizedBox(
              height: 8.h,
            ),
            itemofsettingsscreen(
                leadingicondata: Icons.security_outlined,
                text: "Security",
                trailing: Icons.arrow_forward_ios,
                ontap: () {}),
            SizedBox(
              height: 8.h,
            ),
            itemofsettingsscreen(
                leadingicondata: Icons.info_outline,
                text: "About Us",
                trailing: Icons.arrow_forward_ios,
                ontap: () {}),
            SizedBox(
              height: 8.h,
            ),
            itemofsettingsscreen(
                leadingicondata: Icons.call_outlined,
                text: "Connect Us",
                trailing: Icons.arrow_forward_ios,
                ontap: () {}),
            SizedBox(
              height: 8.h,
            ),
            itemofsettingsscreen(
                leadingicondata: Icons.support_outlined,
                text: "Support",
                trailing: Icons.arrow_forward_ios,
                ontap: () {}),
          ],
        ));
  }
}
