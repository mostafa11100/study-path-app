import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/repos/getuserrepos/abstractepo.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/cubit/cubit/get_user_info_cubit.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/cubit/cubit/update_user_acount_cubit.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/edittextfeild.dart';
import 'package:study_path/utilize/custom_dialog/loadingcircle_prog.dart';
import 'package:study_path/utilize/custom_dialog/simpleawesam.dart';
import 'package:study_path/utilize/loading_circular.dart';

class EditProfilescreen extends StatefulWidget {
  const EditProfilescreen({super.key, required this.user});
  final UserModel user;
  @override
  State<EditProfilescreen> createState() => _EditProfilescreenState();
}

class _EditProfilescreenState extends State<EditProfilescreen> {
  TextEditingController? name;
  TextEditingController? email;
  TextEditingController? password;
  TextEditingController? phone;
  TextEditingController? date;
  @override
  void initState() {
    name = TextEditingController();

    email = TextEditingController();

    password = TextEditingController();

    phone = TextEditingController();

    date = TextEditingController();
    super.initState();
  }

  List<DateTime> listoftime = [];

  GlobalKey<FormState> formk = GlobalKey();
  bool checkchanges() {
    if (email!.text.isNotEmpty ||
        name!.text.isNotEmpty ||
        date!.text.isNotEmpty ||
        phone!.text.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UpdateUserAcountCubit(),
        ),
        BlocProvider(
          create: (context) =>
              GetUserInfoCubit(GetUserFromFirebasee())..getdata(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.white,
            centerTitle: true,
            title: Text(
              "Edit Profile",
              style: TextStyleConst.textStyleconst21,
            )),
        body: BlocBuilder<GetUserInfoCubit, GetUserInfoState>(
          builder: (context, state) {
            if (state is GetUserInfoSuccess) {
              listoftime.add(state.user.dateTime!);
              return BlocListener<UpdateUserAcountCubit, UpdateUserAcountState>(
                listener: (context, state) async {
                  if (state is UpdateUserAcountLoading) {
                    showloadingdialog(context);
                  }
                  if (state is UpdateUserAcountSucces) {
                    await showesuccesdialog(
                        message: "your data update successfully",
                        ontap: () {
                          BlocProvider.of<GetUserInfoCubit>(context).getdata();
                        },
                        context: context);
                  }
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
                    child: SingleChildScrollView(
                      child: Form(
                        onChanged: () {
                          setState(() {
                            checkchanges();
                          });
                        },
                        key: formk,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            profileimageedit(
                                view: () {},
                                changephoto: () {},
                                img: state.user.photourl),
                            SizedBox(
                              height: 15.h,
                            ),
                            EditTextfeild(
                                controler: name,
                                label: "Full Name",
                                hint: state.user.name),
                            SizedBox(
                              height: 12.h,
                            ),
                            EditTextfeild(
                                controler: email,
                                label: "E-mail",
                                hint: state.user.email),
                            SizedBox(
                              height: 12.h,
                            ),
                            EditTextfeild(
                                controler: phone,
                                label: "Phone Numper",
                                hint: state.user.phone),
                            SizedBox(
                              height: 12.h,
                            ),
                            EditTextfeild(
                                security: true,
                                controler: password,
                                label: "Password",
                                hint: "*********"),
                            SizedBox(
                              height: 12.h,
                            ),
                            EditTextfeilddate(
                              context: context,
                              controler: date,
                              results: listoftime,
                              hint: state.user.dateTime!,
                              label: "Date Of Birth",
                            ),
                            SizedBox(
                              height: 40.h,
                            ),
                            SizedBox(
                                height: 42.h,
                                width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 5.0),
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              ColorApp.primarycolor6),
                                      onPressed: () {
                                        if (checkchanges()) {
                                          showeinfodialog(
                                              ontap: () {
                                                BlocProvider.of<
                                                            UpdateUserAcountCubit>(
                                                        context)
                                                    .updateuser(
                                                        checkchangesdata(
                                                  name: name!.text,
                                                  phone: phone!.text,
                                                  date: date!.text,
                                                  emal: email!.text,
                                                ));
                                              },
                                              context: context,
                                              message:
                                                  "Are you sure you want to update the data?");
                                        }
                                      },
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
                ),
              );
            }
            if (state is GetUserInfoFail) {
              return Center(
                child: Text(state.error),
              );
            }
            return LoadingCircular();
          },
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

UserModel checkchangesdata(
    {required String name,
    required String emal,
    required String phone,
    required String date}) {
  print("nammmmee== $date");
  UserModel user = UserModel.tojson(
      name: name.isEmpty ? null : name,
      email: emal.isEmpty ? null : emal,
      phone: phone.isEmpty ? null : phone,
      dateTime: date.isEmpty ? null : DateTime.tryParse(date));
  return user;
}
