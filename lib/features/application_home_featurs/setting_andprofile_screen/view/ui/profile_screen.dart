import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:language_picker/language_picker_dropdown.dart';
import 'package:language_picker/languages.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/itemofsetting_simple.dart';
import 'package:study_path/functions/goroute_fun.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Profile",
          style: TextStyleConst.textStyleconst23,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 35.h,
              ),
              CircleAvatar(
                radius: 50.r,
                backgroundImage: NetworkImage(user.photourl!),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                user.name!,
                style: TextStyleConst.textStyleconst20,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                user.email!,
                style: TextStyleConst.textStyleconst12!
                    .copyWith(color: ColorApp.neturalcolor10),
              ),
              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                  height: 53.h,
                  width: 130.w,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorApp.primarycolor6),
                      onPressed: () {
                        GoRouter.of(context)
                            .push(Approuter.editprofilescreen, extra: user);
                      },
                      child: Text(
                        "Edit Profile",
                        style: TextStyleConst.textStyleconst14!
                            .copyWith(color: Colors.white),
                      ))),
              SizedBox(
                height: 43.h,
              ),
              itemoflanguage(
                leadingicondata: Icons.language_outlined,
                text: 'Language',
                ontap: (Language language) {
                  //_selectedDropdownLanguage = language;
                },
                lang: user.language!,
              ),
              SizedBox(
                height: 14.h,
              ),
              itemofsettingsscreen(
                  leadingicondata: Icons.location_on_outlined,
                  text: 'Location',
                  trailing: Icons.arrow_forward_ios_outlined,
                  ontap: () {
                    GoR(context: context, name: Approuter.locationscreen);
                  }),
              SizedBox(
                height: 14.h,
              ),
              itemofsettingsscreen(
                  leadingicondata: Icons.delete,
                  text: 'Delete',
                  trailing: Icons.arrow_forward_ios_outlined,
                  ontap: () {}),
              SizedBox(
                height: 14.h,
              ),
              itemofsettingsscreen(
                  leadingicondata: Icons.logout_outlined,
                  text: 'Logout',
                  trailing: null,
                  ontap: () {})
            ],
          ),
        ),
      ),
    );
  }
}

Widget itemoflanguage(
    {required IconData leadingicondata,
    required String text,
    required String lang,
    required Function(Language language) ontap}) {
  return ListTile(
    leading: Icon(
      leadingicondata,
      size: 26.r,
    ),
    title: Text(
      text,
      style: TextStyleConst.textStyleconst15,
    ),
    trailing: SizedBox(
      width: 80.w,
      height: 40.h,
      child: LanguagePickerDropdown(
          initialValue: getlang(lang),
          // itemBuilder: _buildDropdownItem,
          onValuePicked: ontap),
    ),
    horizontalTitleGap: 20.r,
  );
}

Language getlang(code) {
  Language lang;
  switch (code) {
    case "en":
      lang = Languages.english;
      break;

    case "ar":
      lang = Languages.arabic;
      break;
    default:
      lang = Languages.arabic;
      break;
  }
  return lang;
}
