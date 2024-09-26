import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/edittextfeild.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/textfeildeddit.dart';
import 'package:study_path/utilize/textfeildcustom_auth.dart';

class EditProfilescreen extends StatelessWidget {
  const EditProfilescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text(
            "Edit Profile",
            style: TextStyleConst.textStyleconst22,
          )),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10.h,
                ),
                profileimageedit(
                    view: () {},
                    changephoto: () {},
                    img:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRVI8wwjmbk07RHjMaoxGcLQw5kRfAizckn7g&s"),
                SizedBox(
                  height: 15.h,
                ),
                EditTextfeild(
                    controler: TextEditingController(),
                    label: "Full Name",
                    hint: "Mostafa salem"),
                SizedBox(
                  height: 12.h,
                ),
                EditTextfeild(
                    controler: TextEditingController(),
                    label: "E-mail",
                    hint: "Mostafasalem@gmail.com"),
                SizedBox(
                  height: 12.h,
                ),
                EditTextfeild(
                    controler: TextEditingController(),
                    label: "Phone Numper",
                    hint: "01200782843"),
                SizedBox(
                  height: 12.h,
                ),
                EditTextfeild(
                    controler: TextEditingController(),
                    label: "Password",
                    hint: "2692002"),
                SizedBox(
                  height: 12.h,
                ),
                EditTextfeilddate(
                    context: context,
                    value: [DateTime.now()],
                    controler: TextEditingController(),
                    label: "Date Of Birth",
                    hint: "26/9/2002"),
                SizedBox(
                  height: 30.h,
                ),
                SizedBox(
                    height: 42.h,
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5.0),
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: ColorApp.primarycolor6),
                          onPressed: () {},
                          child: Text(
                            "Update",
                            style: TextStyleConst.textStyleconst16!
                                .copyWith(color: Colors.white),
                          )),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget profileimageedit({img, changephoto, view}) {
  return SizedBox(
    // height: 100.h,
    // width: 100.w,
    child: Stack(
      children: [
        InkWell(
            onTap: view,
            child: CircleAvatar(
              radius: 57.r,
              backgroundImage: NetworkImage(img),
              backgroundColor: Colors.white,
            )),
        Positioned(
            left: 68.w,
            top: 68.h,
            child: CircleAvatar(
              radius: 20.r,
              backgroundColor: ColorApp.primarycolor6,
              child: InkWell(
                  onTap: changephoto,
                  child: const Icon(Icons.camera_alt_outlined,
                      color: Colors.white)),
            ))
      ],
    ),
  );
}
