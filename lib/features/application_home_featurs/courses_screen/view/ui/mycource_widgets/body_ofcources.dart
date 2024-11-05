import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/cubit/cubit_get_mycources/get_my_cources_cubit.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycource_widgets/itemofbody_ofcources.dart';

Widget bodyofcources(
    {required List<MyCourcesModeldetails> listofcources, required ontap}) {
  return ListView.builder(
      itemCount: listofcources.length,
      itemBuilder: (context, i) {
        return Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: InkWell(
                onTap: () {
                  ontap(i);
                },
                child: itemofcources(model: listofcources[i])));
      });
}
