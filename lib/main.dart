import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/approuter.dart';
import 'package:study_path/const/color_app.dart';
import 'package:device_preview/device_preview.dart';
import 'package:study_path/const/themedata.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:study_path/generated/l10n.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  runApp(
    // DevicePreview(
    // enabled: !kReleaseMode,

    //builder: (context) =>
    const StudyPathAPP(), // Wrap your app
    //)
  );
}

class StudyPathAPP extends StatelessWidget {
  const StudyPathAPP({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        // designSize:  Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp.router(
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: DevicePreview.locale(context),
              builder: DevicePreview.appBuilder,
              routerConfig: Approuter.routs,
              theme: Themeappdata.lighttheme);
        });
  }
}
