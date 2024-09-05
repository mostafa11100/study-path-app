import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/const/images_assets.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycource_widgets/body_ofcources.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycource_widgets/customappbar.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/relatedcourse_screen.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class MycourcesScreen extends StatefulWidget {
  MycourcesScreen({super.key});

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
      appBar: customappbar(context: context, tapcont: tapcon!),
      body: TabBarView(controller: tapcon!, children: [
        bodyofcources(context),
        bodyofcources(context),
        relatedcourcesscreen()
      ]),

      // Expanded(child:TabBarView(children:
      // [

      // ]))
    );
  }
}
