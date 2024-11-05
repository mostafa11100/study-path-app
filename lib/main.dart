// ignore_for_file: deprecated_member_use

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:study_path/approuter.dart';
import 'package:device_preview/device_preview.dart';
import 'package:study_path/const/themedata.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:study_path/firebase_options.dart';
import 'package:study_path/generated/l10n.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final PendingDynamicLinkData? initialLink =
      await FirebaseDynamicLinks.instance.getInitialLink();

  if (initialLink != null) {
    final Uri deepLink = initialLink.link;
    // Example of using the dynamic link to push the user to a different screen
    print("enter to app againnnn ${deepLink}");
  }

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
        designSize: Size(MediaQuery.of(context).size.width,
            MediaQuery.of(context).size.height),
        minTextAdapt: true,
        splitScreenMode: true,
        // Use builder only if you need to use library outside ScreenUtilInit context
        builder: (_, child) {
          return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
              locale: const Locale("en"),
              builder: DevicePreview.appBuilder,
              routerConfig: Approuter.routs,
              theme: Themeappdata.lighttheme);
        });
  }
}
