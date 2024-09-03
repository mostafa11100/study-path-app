import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycources_screen.dart';
import 'package:study_path/features/application_home_featurs/home_screen_app.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/category_screen.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/home_screen.dart';
import 'package:study_path/features/auth/forgetpassword/view/ui/createnewpassowrd_screen.dart';
import 'package:study_path/features/auth/forgetpassword/view/ui/createpass_donescreen.dart';
import 'package:study_path/features/auth/forgetpassword/view/ui/forgetpassword_screen.dart';
import 'package:study_path/features/auth/forgetpassword/view/ui/otp_screen_forgetpassword.dart';
import 'package:study_path/features/auth/signin/view/ui/login_screen.dart';
import 'package:study_path/features/auth/signup/view/ui/createacount.dart';
import 'package:study_path/features/onbording/view/onbording_screen.dart';
import 'package:study_path/features/splash_screen/splash_screen.dart';
import 'package:study_path/main.dart';

class Approuter {
  static String splashscreen = "/";
  static String onbording = "/onbording";
  static String signup = "/signup";
  static String signin = "/signin";
  static String forgetpassword = "/forgetpassword";
  static String otpscreen = "/otpscreen";
  static String createnewpass = "/createnewpass";

  static String createnewpassdone = "/createnewpassdone";

  static String homescreenapp = "/homescreenapp";

  static String homescreen = "/homescreen";

  static String mycourcesscreen = "/";

  static String categorydcreen = "/categorydcreen";

  static GoRouter routs = GoRouter(routes: [
    GoRoute(
        path: splashscreen,
        builder: (context, s) {
          return const SplashScreen();
        }),
    GoRoute(
      path: onbording,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: MycourcesScreen(),
            transitionsBuilder: (context, an1, an2, ch) {
              Offset begain = const Offset(1, 0);
              Offset end = Offset.zero;
              Animation<double> curv =
                  CurveTween(curve: Curves.ease).animate(an1);
              Animation<Offset> tween =
                  Tween(begin: begain, end: end).animate(curv);
              return SlideTransition(
                position: tween,
                child: ch,
              );
            });
      },
    ),
    GoRoute(
      path: onbording,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: const OnbordingScreen(),
            transitionsBuilder: (context, an1, an2, ch) {
              Offset begain = const Offset(1, 0);
              Offset end = Offset.zero;
              Animation<double> curv =
                  CurveTween(curve: Curves.ease).animate(an1);
              Animation<Offset> tween =
                  Tween(begin: begain, end: end).animate(curv);
              return SlideTransition(
                position: tween,
                child: ch,
              );
            });
      },
    ),
    GoRoute(
      path: signup,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: CreateacountScreen(),
            transitionsBuilder: (context, an1, an2, ch) {
              Offset begain = const Offset(1, 0);
              Offset end = Offset.zero;
              Animation<double> curv =
                  CurveTween(curve: Curves.ease).animate(an1);
              Animation<Offset> tween =
                  Tween(begin: begain, end: end).animate(curv);
              return SlideTransition(
                position: tween,
                child: ch,
              );
            });
      },
    ),
    GoRoute(
      path: signin,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: LoginScreen(),
            transitionsBuilder: (context, an1, an2, ch) {
              Offset begain = const Offset(1, 0);
              Offset end = Offset.zero;
              Animation<double> curv =
                  CurveTween(curve: Curves.ease).animate(an1);
              Animation<Offset> tween =
                  Tween(begin: begain, end: end).animate(curv);
              return SlideTransition(
                position: tween,
                child: ch,
              );
            });
      },
    ),
    GoRoute(
      path: forgetpassword,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: const ForgetpasswordScreen(),
            transitionsBuilder: (context, an1, an2, ch) {
              Offset begain = const Offset(1, 0);
              Offset end = Offset.zero;
              Animation<double> curv =
                  CurveTween(curve: Curves.ease).animate(an1);
              Animation<Offset> tween =
                  Tween(begin: begain, end: end).animate(curv);
              return SlideTransition(
                position: tween,
                child: ch,
              );
            });
      },
    ),
    GoRoute(
      path: otpscreen,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: const OtpScreenForgetpassword(),
            transitionsBuilder: (context, an1, an2, ch) {
              Offset begain = const Offset(1, 0);
              Offset end = Offset.zero;
              Animation<double> curv =
                  CurveTween(curve: Curves.ease).animate(an1);
              Animation<Offset> tween =
                  Tween(begin: begain, end: end).animate(curv);
              return SlideTransition(
                position: tween,
                child: ch,
              );
            });
      },
    ),
    GoRoute(
      path: createnewpass,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: CreatenewpassowrdScreen(),
            transitionsBuilder: (context, an1, an2, ch) {
              Offset begain = const Offset(1, 0);
              Offset end = Offset.zero;
              Animation<double> curv =
                  CurveTween(curve: Curves.ease).animate(an1);
              Animation<Offset> tween =
                  Tween(begin: begain, end: end).animate(curv);
              return SlideTransition(
                position: tween,
                child: ch,
              );
            });
      },
    ),
    GoRoute(
      path: createnewpassdone,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: const CreatepassDonescreen(),
            transitionsBuilder: (context, an1, an2, ch) {
              Offset begain = const Offset(1, 0);
              Offset end = Offset.zero;
              Animation<double> curv =
                  CurveTween(curve: Curves.ease).animate(an1);
              Animation<Offset> tween =
                  Tween(begin: begain, end: end).animate(curv);
              return SlideTransition(
                position: tween,
                child: ch,
              );
            });
      },
    ),
    GoRoute(
      path: homescreenapp,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: HomeScreenApp(),
            transitionsBuilder: (context, an1, an2, ch) {
              Offset begain = const Offset(1, 0);
              Offset end = Offset.zero;
              Animation<double> curv =
                  CurveTween(curve: Curves.ease).animate(an1);
              Animation<Offset> tween =
                  Tween(begin: begain, end: end).animate(curv);
              return SlideTransition(
                position: tween,
                child: ch,
              );
            });
      },
    ),
    GoRoute(
      path: homescreen,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: HomeScreen(),
            transitionsBuilder: (context, an1, an2, ch) {
              Offset begain = const Offset(1, 0);
              Offset end = Offset.zero;
              Animation<double> curv =
                  CurveTween(curve: Curves.ease).animate(an1);
              Animation<Offset> tween =
                  Tween(begin: begain, end: end).animate(curv);
              return SlideTransition(
                position: tween,
                child: ch,
              );
            });
      },
    ),
    GoRoute(
      path: categorydcreen,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: CategoryScreen(category: s.extra as String),
            transitionsBuilder: (context, an1, an2, ch) {
              Offset begain = const Offset(1, 0);
              Offset end = Offset.zero;
              Animation<double> curv =
                  CurveTween(curve: Curves.ease).animate(an1);
              Animation<Offset> tween =
                  Tween(begin: begain, end: end).animate(curv);
              return SlideTransition(
                position: tween,
                child: ch,
              );
            });
      },
    ),
  ]);
}
