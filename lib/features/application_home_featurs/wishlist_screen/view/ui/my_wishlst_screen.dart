import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/search_feild.dart';
import 'package:study_path/features/application_home_featurs/wishlist_screen/view/ui/wishkist_screen_widgets/wishlist_cource.dart';

class MyWishlistScreen extends StatelessWidget {
  const MyWishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        title: Text(
          "My Wishlist",
          style: TextStyleConst.textStyleconst20,
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: EdgeInsets.all(6.0.w),
          child: Column(
            children: [
              searchfeildcustom(
                  complete: () {}, filterontap: () {}, context: context),
              Expanded(
                  child: bodyofwishlist_cources(
                      context: context, coursesemodel: []))
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget bodyofwishlist_cources({
  required BuildContext context,
  required List coursesemodel,
  dynamic ontap,
}) {
  return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: wishlistitem(context, CourseModel(), () {}),
        );
      });
}
