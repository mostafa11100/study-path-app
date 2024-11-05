import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/homescreen_widgets/search_feild.dart';
import 'package:study_path/features/application_home_featurs/wishlist_screen/view/cubit/cubit/get_w_ishlist_cubit.dart';
import 'package:study_path/features/application_home_featurs/wishlist_screen/view/ui/wishkist_screen_widgets/wishlist_cource.dart';
import 'package:study_path/utilize/getcources_and_instracture/get_instracture_and_cources.dart';
import 'package:study_path/utilize/loading_circular.dart';

class MyWishlistScreen extends StatelessWidget {
  const MyWishlistScreen({super.key, required this.user});
  final UserModel user;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWIshlistCubit()..getsishlist(user),
      child: Scaffold(
        appBar: AppBar(
          leading: const SizedBox(),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: Text(
            "My Wishlist",
            style: TextStyleConst.textStyleconst20,
          ),
          centerTitle: true,
        ),
        body: BlocBuilder<GetWIshlistCubit, GetWIshlistState>(
          builder: (context, state) {
            if (state is GetWIshlistFail) {
              return Center(
                child: Text(state.error),
              );
            }
            if (state is GetWIshlistSucces) {
              return SizedBox(
                height: MediaQuery.of(context).size.height,
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0.h, horizontal: 10),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(8.0.w),
                        child: searchfeildcustom(
                            complete: () {},
                            filterontap: () {},
                            context: context),
                      ),
                      Expanded(
                          //height: MediaQuery.of(context).size.height,
                          child: bodyofwishlist_cources(
                              context: context, coursesemodel: state.result))
                    ],
                  ),
                ),
              );
            } else {
              return LoadingCircular();
            }
          },
        ),
      ),
    );
  }
}

// ignore: non_constant_identifier_names
Widget bodyofwishlist_cources({
  required BuildContext context,
  required List<CourseAllDetails> coursesemodel,
  dynamic ontap,
}) {
  return ListView.builder(
      itemCount: coursesemodel.length,
      itemBuilder: (context, i) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 4.0),
          child: wishlistitem(
              context: context, model: coursesemodel[i], active: true),
        );
      });
}
