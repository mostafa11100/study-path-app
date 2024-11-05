import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/class/paypal_api_operatoin/paypal_api.dart';
import 'package:study_path/class/paypalmodels/response_createorder_model.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/cubit/cubit/add_to_wishlist_cubit.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/cubit/gettokencubit/cubit/get_token_cubit.dart';
import 'package:study_path/generated/l10n.dart';
import 'package:study_path/utilize/custom_dialog/loadingcircle_prog.dart';
import 'package:study_path/utilize/getcources_and_instracture/get_instracture_and_cources.dart';
import 'package:url_launcher/url_launcher.dart';

Widget courseitem(
    {context,
    required CourseAllDetails coursemodel,
    required Function() ontap}) {
  bool active = false;
  return MultiBlocProvider(
    providers: [
      BlocProvider(
        create: (context) => AddToWishlistCubit(),
      ),
      BlocProvider(
        create: (context) => GetTokenCubit(),
      ),
    ],
    child: BlocListener<GetTokenCubit, GetTokenState>(
      listener: (context, state) async {
        if (state is GetTokenLoading) {
          showloadingdialog(context);
        }
        if (state is GetTokenSuccess) {
          GoRouter.of(context).pop();
          await completepayment(
              token: state.token,
              successpayment: (deepLink) {
                GoRouter.of(context).pushReplacementNamed(deepLink.toString(),
                    extra: coursemodel);
              },
              canselpayment: (deeplink) {});
        }
      },
      child: Builder(builder: (context) {
        return SizedBox(
          // height: 200,
          width: 205.w,

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: ColorApp.neturalcolor2,
                    image: DecorationImage(
                        image: NetworkImage(coursemodel.courseModel!.coverurl!),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.r),
                        topRight: Radius.circular(10.r))),
                height: 130.h,
              ),
              ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 6.w),
                leading: Text(
                  coursemodel.courseModel!.title!,
                  style: TextStyleConst.textStyleconst15,
                ),
                trailing: StatefulBuilder(builder: (context, setstate) {
                  return InkWell(
                    onTap: () {
                      BlocProvider.of<AddToWishlistCubit>(context)
                          .add(coursemodel.courseModel!.docsuid);

                      active = !active;
                    },
                    child: BlocBuilder<AddToWishlistCubit, AddToWishlistState>(
                      builder: (context, state) {
                        if (state is AddToWishlistSucces) {
                          return Icon(
                            Icons.favorite_rounded,
                            color: ColorApp.primarycolor6,
                          );
                        } else {
                          return Icon(
                            Icons.favorite_outline,
                            color: ColorApp.neturalcolor11,
                          );
                        }
                      },
                    ),
                  );
                }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 7.0, vertical: 3),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      coursemodel.instractureModel!.name!,
                      style: TextStyleConst.textStyleconst12!
                          .copyWith(color: ColorApp.neturalcolor10),
                    ),
                    SizedBox(
                      height: 6.h,
                    ),
                    Text(
                      "${coursemodel.courseModel!.time!}Hours",
                      style: TextStyleConst.textStyleconst12!
                          .copyWith(color: ColorApp.neturalcolor10),
                    ),
                    SizedBox(
                      height: 7.w,
                    ),
                    Row(
                      children: [
                        Text(
                          "${coursemodel.courseModel!.price!}",
                          style: TextStyleConst.textStyleconst13!.copyWith(
                              color: ColorApp.neturalcolor12,
                              decoration: TextDecoration.lineThrough),
                        ),
                        SizedBox(
                          width: 10.w,
                        ),
                        Text(
                          "${coursemodel.courseModel!.discount}",
                          style: TextStyleConst.textStyleconst13!,
                        ),
                        const Spacer(),
                        InkWell(
                          splashColor: Colors.white,
                          onTap: () async {
                            //   showchoicepayment(context);
                            BlocProvider.of<GetTokenCubit>(context).gettoken();
                          },
                          child: Text(S.current.BuyNow,
                              style: TextStyleConst.textStyleconst14!.copyWith(
                                  color: ColorApp.primarycolor6,
                                  fontWeight: FontWeight.w700,
                                  decoration: TextDecoration.underline,
                                  decorationColor: ColorApp.primarycolor6)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    ),
  );
}

int calculateDaysUntil(DateTime targetDate) {
  DateTime today = DateTime.now(); // الحصول على التاريخ الحالي
  Duration difference =
      targetDate.difference(today); // حساب الفرق بين التاريخين
  return difference.inDays; // إرجاع عدد الأيام
}

Future<String?> completepayment({token, successpayment, canselpayment}) async {
//  get token ;

  ResponseRoderModel res = await ApiService.createorder(
      token: token,
      succespayment: successpayment,
      canselpayment: canselpayment);

  await launchUrl(Uri.parse(res.links[1].href!));
  return res.id;
}
