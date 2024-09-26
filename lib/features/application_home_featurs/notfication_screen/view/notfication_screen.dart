import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/color_app.dart';
import 'package:study_path/const/fontstyleconst.dart';

class NotficationScreen extends StatelessWidget {
  const NotficationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(
          Icons.arrow_back_ios,
          size: 22.r,
        ),
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Notficatios",
          style: TextStyleConst.textStyleconst20,
        ),
      ),
      body: Container(),
    );
  }
}

Widget bodyofnotficationsscreen({required List<Widget> listofnotfction}) {
  return ListView.builder(itemBuilder: (context, i) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: listofnotfction[i],
    );
  });
}

List<Widget> listofnotfction_ginerate(
    {required List<NotficationModel> listofnotfication,
    required BuildContext context}) {
  List<Widget> listofnotfc = [];
  DateTime timemax = DateTime.now();
  listofnotfication.forEach((value) {
    if (value.time!.hour - timemax.hour > 24) {
      listofnotfc.add(Container(
        width: MediaQuery.of(context).size.width,
        height: 2.h,
        decoration: BoxDecoration(
            color: ColorApp.neturalcolor9,
            borderRadius: BorderRadius.circular(4.r)),
      ));

      listofnotfc.add(Text(value.time!.hour < 24
          ? "Today"
          : value.time!.hour < 48
              ? "Yesterday"
              : value.time!.toString()));

      timemax = value.time!;
    }
    listofnotfc.add(itemofnotfication(model: value, context: context));
  });
  return listofnotfc;
}

Widget itemofnotfication(
    {required NotficationModel model, required BuildContext context}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width,
    height: 120.h,
    child: Row(
      children: [
        Column(
          children: [
            Text(
              model.notfication!,
              style: TextStyleConst.textStyleconst14,
            ),
            SizedBox(
              height: 10.h,
            ),
            Text(
              model.time!.toString(),
              style: TextStyleConst.textStyleconst12!
                  .copyWith(color: ColorApp.neturalcolor10),
            )
          ],
        ),
        Spacer(),
        AspectRatio(
          aspectRatio: 1.2,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.r),
                image: DecorationImage(
                    image: NetworkImage(model.imglink!), fit: BoxFit.cover)),
          ),
        )
      ],
    ),
  );
}

class NotficationModel {
  String? notfication;
  String? imglink;
  String? notficationlink;
  DateTime? time;
  NotficationModel(
      this.notfication, this.imglink, this.notficationlink, this.time);
  NotficationModel.fromjson({required Map json}) {
    notfication = json['notfication'];
    imglink = json['imagelink'];
    notficationlink = json['notficationlink'];
    DateTime t = json['time'];
    time = t;
  }
}
