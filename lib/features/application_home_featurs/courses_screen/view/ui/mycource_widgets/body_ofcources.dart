import 'package:flutter/material.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycource_widgets/itemofbody_ofcources.dart';

Widget bodyofcources(context) {
  return ListView.builder(
      itemCount: 20,
      itemBuilder: (context, i) {
        return Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: itemofcources(context));
      });
}
