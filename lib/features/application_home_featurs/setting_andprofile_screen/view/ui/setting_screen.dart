import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/item_with_switch.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/itemofsetting_simple.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/litemofprofile.dart';
import 'package:study_path/functions/goroute_fun.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  bool darkmodel = false;
  bool notfication = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          // leading: InkWell(
          //     onTap: () {
          //       GoRouter.of(context).pop();
          //     },
          //     child: const Icon(Icons.arrow_back_ios_new)),
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
                  print("enttwer");
                  GoR(context: context, name: Approuter.profilescreen);
                },
                img:
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI8wwjmbk07RHjMaoxGcLQw5kRfAizckn7g&s",
                title: "mostafa salem",
                subtitle: "mostafasalem39956@gmail.com"),
            SizedBox(
              height: 35.h,
            ),
            itemofsettingsscreenwithswich(
              leadingicondata: Icons.dark_mode,
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
              leadingicondata: Icons.notifications,
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
                leadingicondata: Icons.privacy_tip_rounded,
                text: "Privacy",
                trailing: Icons.arrow_forward_ios,
                ontap: () {}),
            SizedBox(
              height: 10.h,
            ),
            itemofsettingsscreen(
                leadingicondata: Icons.security_outlined,
                text: "Security",
                trailing: Icons.arrow_forward_ios,
                ontap: () {}),
            SizedBox(
              height: 10.h,
            ),
            itemofsettingsscreen(
                leadingicondata: Icons.info,
                text: "About Us",
                trailing: Icons.arrow_forward_ios,
                ontap: () {}),
            SizedBox(
              height: 10.h,
            ),
            itemofsettingsscreen(
                leadingicondata: Icons.call_outlined,
                text: "Connect Us",
                trailing: Icons.arrow_forward_ios,
                ontap: () {}),
            SizedBox(
              height: 10.h,
            ),
            itemofsettingsscreen(
                leadingicondata: Icons.question_answer,
                text: "Support",
                trailing: Icons.arrow_forward_ios,
                ontap: () {}),
          ],
        ));
  }
}
