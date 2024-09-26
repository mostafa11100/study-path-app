import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/const/fontstyleconst.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/textfeild_date.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/setting_widgets/textfeildeddit.dart';

Widget EditTextfeild({label, hint, controler, security}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyleConst.textStyleconst14,
      ),
      SizedBox(
        height: 5.h,
      ),
      TextFeildCustom_editing(
        security: security,
        controler: controler,
        hint: hint,
      ),
    ],
  );
}

Widget EditTextfeilddate(
    {label, hint, controler, context, value, List<DateTime?>? results}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: TextStyleConst.textStyleconst14,
      ),
      SizedBox(
        height: 5.h,
      ),
      TextFeildCustom_date(
        value: [DateTime.now()],
        dateontap: () async {
          results = await showCalendarDatePicker2Dialog(
            context: context,
            config: CalendarDatePicker2WithActionButtonsConfig(),
            dialogSize: const Size(325, 400),
            value: value!,
            borderRadius: BorderRadius.circular(15),
          );
        },
        controler: controler,
        hint: hint,
      ),
    ],
  );
}
