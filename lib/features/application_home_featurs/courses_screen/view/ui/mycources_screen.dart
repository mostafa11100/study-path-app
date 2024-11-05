import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/cubit/cubit_get_mycources/get_my_cources_cubit.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycource_widgets/body_ofcources.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycource_widgets/customappbar.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/relatedcourse_screen.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/utilize/loading_circular.dart';

class MycourcesScreen extends StatefulWidget {
  const MycourcesScreen({super.key, required this.user});
  final UserModel user;
  @override
  State<MycourcesScreen> createState() => _MycourcesScreenState();
}

class _MycourcesScreenState extends State<MycourcesScreen>
    with TickerProviderStateMixin {
  bool visible = true;
  TabController? tapcon;
  @override
  void initState() {
    tapcon = TabController(length: 3, vsync: this);
    tapcon!.addListener(() {
      // if (tapcon!.index != 0) {
      setState(() {});
      //}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetMyCourcesCubit()..getcources(user: widget.user),
        child: BlocBuilder<GetMyCourcesCubit, GetMyCourcesState>(
          builder: (context, state) {
            if (state is GetMyCourcesSuccess) {
              return Bodyofmycources(
                user: widget.user,
                mycourceslist: state.mycourceslist,
                tapcon: tapcon,
              );
            }
            if (state is GetMyCourcesFail) {
              return Center(
                child: Text("Oops  ${state.error}"),
              );
            }

            return LoadingCircular();
          },
        ),
      ),
    );
  }
}

class Bodyofmycources extends StatelessWidget {
  const Bodyofmycources(
      {super.key,
      required this.user,
      this.tapcon,
      required this.mycourceslist});
  final UserModel user;
  final TabController? tapcon;
  final List<MyCourcesModeldetails> mycourceslist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customappbar(
        context: context,
        tapcont: tapcon!,
        models: mycourceslist,
      ),
      body: TabBarView(controller: tapcon!, children: [
        bodyofcources(
            listofcources: mycourceslist,
            ontap: (i) {
              GoRouter.of(context).push(Approuter.playlistscreen,
                  extra: mycourceslist[i].courseAllDetails!);
            }),
        Trackincreen(
          mycourceslist: mycourceslist,
        ),
        relatedcourcesscreen(
            category: mycourceslist.isNotEmpty
                ? mycourceslist[0].courseAllDetails!.courseModel!.category!
                : '')
      ]),

      // Expanded(child:TabBarView(children:
      // [

      // ]))
    );
  }
}

class Trackincreen extends StatelessWidget {
  const Trackincreen({super.key, required this.mycourceslist});
  final List<MyCourcesModeldetails> mycourceslist;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: bodyofcources(
          listofcources: mycourceslist,
          ontap: (i) {
            GoRouter.of(context)
                .push(Approuter.tasksschedula, extra: mycourceslist[i]);
          }),
    );
  }
}
