import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/cubit/cubit_get_mycources/get_my_cources_cubit.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/course_schedula.dart';
import 'package:study_path/features/application_home_featurs/courses_screen/view/ui/mycources_screen.dart';
import 'package:study_path/features/application_home_featurs/home_screen_app.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/course_model.dart';
import 'package:study_path/features/application_home_featurs/homescreens/data/models/user_model.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/category_screen.dart';
import 'package:study_path/features/application_home_featurs/homescreens/view/ui/home_screen.dart';
import 'package:study_path/features/application_home_featurs/instracure_screen/view/ui/instracture_screen.dart';
import 'package:study_path/features/application_home_featurs/payment_screen/view/ui/success_screen.dart';
import 'package:study_path/features/application_home_featurs/playlist_course_screen/view/ui/playlist_screen.dart';
import 'package:study_path/features/application_home_featurs/resources_screen/view/ui/resources_screen.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/edit_profilescreen.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/location_screen.dart';
import 'package:study_path/features/application_home_featurs/setting_andprofile_screen/view/ui/profile_screen.dart';
import 'package:study_path/features/auth/forgetpassword/view/ui/createnewpassowrd_screen.dart';
import 'package:study_path/features/auth/forgetpassword/view/ui/createpass_donescreen.dart';
import 'package:study_path/features/auth/forgetpassword/view/ui/forgetpass_getemailscreen.dart';
import 'package:study_path/features/auth/forgetpassword/view/ui/forgetpassword_screen.dart';
import 'package:study_path/features/auth/forgetpassword/view/ui/otp_screen_forgetpassword.dart';
import 'package:study_path/features/auth/forgetpassword/view/ui/password_created_succes_screen.dart';
import 'package:study_path/features/auth/signin/view/ui/login_screen.dart';
import 'package:study_path/features/auth/signup/view/ui/createacount.dart';
import 'package:study_path/features/auth/signup/view/ui/success_screen.dart';
import 'package:study_path/features/onbording/view/onbording_screen.dart';
import 'package:study_path/features/splash_screen/splash_screen.dart';
import 'package:study_path/utilize/getcources_and_instracture/get_instracture_and_cources.dart';

class Approuter {
  static String splashscreen = "/";

  static String profilescreen = "/profilescreen";

  static String successcreatenewpassword = "/successcreatenewpassword";

  static String successpaymentscreen = "/successpay";

  static String canselPaymentscreen = "https://www.cansel.com/";
  static String sendcoderesetscreen = "/sendcoderesetscreen";
  static String playlistscreen = "/playlistscreen";
  static String onbording = "/on";
  static String signup = "/signup";
  static String signin = "/signin";
  static String forgetpassword = "/forgetpassword";
  static String otpscreen = "/otpscreen";
  static String createnewpass = "/createnewpass";

  static String locationscreen = "/locationscreen";

  static String createnewpassdone = "/createnewpassdone";

  static String homescreenapp = "/homescreenapp";

  static String successcreateacountscreen = "/successcreateacountscreen";

  static String homescreen = "/homescreen";

  static String mycourcesscreen = "/mycourcesscreen";

  static String categorydcreen = "/categorydcreen";

  static String resourcesscreen = "/resourcesscreen";

  static String editprofilescreen = "/editprofilescreen";

  static String instracturescreen = "/instracturescreen";

  static String tasksschedula = "/taskschedula";

  static GoRouter routs = GoRouter(routes: [
    GoRoute(
        path: splashscreen,
        builder: (context, s) {
          return const SplashScreen();
        }),
    // GoRoute(
    //   path: mycourcesscreen,
    //   pageBuilder: (context, s) {
    //     return CustomTransitionPage(
    //         transitionDuration: const Duration(milliseconds: 600),
    //         child: MycourcesScreen(),
    //         transitionsBuilder: (context, an1, an2, ch) {
    //           Offset begain = const Offset(1, 0);
    //           Offset end = Offset.zero;
    //           Animation<double> curv =
    //               CurveTween(curve: Curves.ease).animate(an1);
    //           Animation<Offset> tween =
    //               Tween(begin: begain, end: end).animate(curv);
    //           return SlideTransition(
    //             position: tween,
    //             child: ch,
    //           );
    //         });
    //   },
    // ),
    GoRoute(
      path: sendcoderesetscreen,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: ForgetpassSendcodeScreen(),
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
      path: tasksschedula,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: CourseSchedulaScreen(
              model: s.extra as MyCourcesModeldetails,
            ),
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
      path: successcreatenewpassword,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: const PasswordCreatedSuccesScreen(),
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
      path: successcreateacountscreen,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: const CreatedAcountSuccess(),
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
      path: instracturescreen,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: InstractureScreen(
              uid: s.extra as String,
            ),
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
      path: locationscreen,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: const LocationScreen(),
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
      path: editprofilescreen,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: EditProfilescreen(user: s.extra as UserModel),
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
      path: profilescreen,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: ProfileScreen(
              user: s.extra as UserModel,
            ),
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
      path: resourcesscreen,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: ResourcesScreen(
              model: s.extra as CourseModel,
            ),
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
      path: playlistscreen,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: PlayListScreen(
              courseAllDetails: s.extra as CourseAllDetails,
            ),
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
      name: "https://www.success.com/",
      path: successpaymentscreen,
      pageBuilder: (context, s) {
        return CustomTransitionPage(
            transitionDuration: const Duration(milliseconds: 600),
            child: SuccessPayment(
              coursemodel: s.extra as CourseAllDetails,
            ),
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
            child: OtpScreenForgetpassword(
              provider: s.extra as String,
            ),
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
            child: CreatenewpassowrdScreen(
              code: s.extra as String,
            ),
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
    // GoRoute(
    //   path: homescreen,
    //   pageBuilder: (context, s) {
    //     return CustomTransitionPage(
    //         transitionDuration: const Duration(milliseconds: 600),
    //         child: HomeScreen(),
    //         transitionsBuilder: (context, an1, an2, ch) {
    //           Offset begain = const Offset(1, 0);
    //           Offset end = Offset.zero;
    //           Animation<double> curv =
    //               CurveTween(curve: Curves.ease).animate(an1);
    //           Animation<Offset> tween =
    //               Tween(begin: begain, end: end).animate(curv);
    //           return SlideTransition(
    //             position: tween,
    //             child: ch,
    //           );
    //         });
    //   },
    // ),
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
