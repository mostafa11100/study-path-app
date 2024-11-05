// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `LogIn`
  String get LogIn {
    return Intl.message(
      'LogIn',
      name: 'LogIn',
      desc: '',
      args: [],
    );
  }

  /// `SignUp`
  String get SignUp {
    return Intl.message(
      'SignUp',
      name: 'SignUp',
      desc: '',
      args: [],
    );
  }

  /// `Welcome To StudyPath`
  String get Welcome {
    return Intl.message(
      'Welcome To StudyPath',
      name: 'Welcome',
      desc: '',
      args: [],
    );
  }

  /// `Create Your Acount`
  String get CreateYourAcount {
    return Intl.message(
      'Create Your Acount',
      name: 'CreateYourAcount',
      desc: '',
      args: [],
    );
  }

  /// `First name`
  String get Firstname {
    return Intl.message(
      'First name',
      name: 'Firstname',
      desc: '',
      args: [],
    );
  }

  /// `Last name`
  String get Lastname {
    return Intl.message(
      'Last name',
      name: 'Lastname',
      desc: '',
      args: [],
    );
  }

  /// `E-mail or phone number`
  String get Emailorphonenumber {
    return Intl.message(
      'E-mail or phone number',
      name: 'Emailorphonenumber',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Confirt password`
  String get Comfertpassword {
    return Intl.message(
      'Confirt password',
      name: 'Comfertpassword',
      desc: '',
      args: [],
    );
  }

  /// `Already have acount`
  String get Alreadyhaveacount {
    return Intl.message(
      'Already have acount',
      name: 'Alreadyhaveacount',
      desc: '',
      args: [],
    );
  }

  /// `Login to your acount`
  String get LogIntoyouracount {
    return Intl.message(
      'Login to your acount',
      name: 'LogIntoyouracount',
      desc: '',
      args: [],
    );
  }

  /// `Welcome back`
  String get Welcomeback {
    return Intl.message(
      'Welcome back',
      name: 'Welcomeback',
      desc: '',
      args: [],
    );
  }

  /// `Remember me`
  String get rememberme {
    return Intl.message(
      'Remember me',
      name: 'rememberme',
      desc: '',
      args: [],
    );
  }

  /// `Forget password`
  String get Forgetpassword {
    return Intl.message(
      'Forget password',
      name: 'Forgetpassword',
      desc: '',
      args: [],
    );
  }

  /// `Or login with`
  String get orloginwith {
    return Intl.message(
      'Or login with',
      name: 'orloginwith',
      desc: '',
      args: [],
    );
  }

  /// `Don''t have an acount`
  String get Donthaveanacount {
    return Intl.message(
      'Don\'\'t have an acount',
      name: 'Donthaveanacount',
      desc: '',
      args: [],
    );
  }

  /// `verify your identity`
  String get verifyyouidentify {
    return Intl.message(
      'verify your identity',
      name: 'verifyyouidentify',
      desc: '',
      args: [],
    );
  }

  /// `Select a Methode you like to send you verification code`
  String get selectmethode {
    return Intl.message(
      'Select a Methode you like to send you verification code',
      name: 'selectmethode',
      desc: '',
      args: [],
    );
  }

  /// `Verify By E-mail`
  String get verifybyemail {
    return Intl.message(
      'Verify By E-mail',
      name: 'verifybyemail',
      desc: '',
      args: [],
    );
  }

  /// `Verify By phone sms`
  String get verifybysms {
    return Intl.message(
      'Verify By phone sms',
      name: 'verifybysms',
      desc: '',
      args: [],
    );
  }

  /// `Verify By phone call`
  String get VerifyByphonecall {
    return Intl.message(
      'Verify By phone call',
      name: 'VerifyByphonecall',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get Continue {
    return Intl.message(
      'Continue',
      name: 'Continue',
      desc: '',
      args: [],
    );
  }

  /// `I Remember my password`
  String get IRemembermypassword {
    return Intl.message(
      'I Remember my password',
      name: 'IRemembermypassword',
      desc: '',
      args: [],
    );
  }

  /// `Congrateulations`
  String get Congrateulations {
    return Intl.message(
      'Congrateulations',
      name: 'Congrateulations',
      desc: '',
      args: [],
    );
  }

  /// `you have successfully update your password now you can login`
  String get youhavesuccessfullyupdate {
    return Intl.message(
      'you have successfully update your password now you can login',
      name: 'youhavesuccessfullyupdate',
      desc: '',
      args: [],
    );
  }

  /// `Enter your verification Code`
  String get EnteryourverificationCode {
    return Intl.message(
      'Enter your verification Code',
      name: 'EnteryourverificationCode',
      desc: '',
      args: [],
    );
  }

  /// `we send a text message with your verification code to the phone number ending with (*********45)`
  String get sendedatextverificationcodetothephone {
    return Intl.message(
      'we send a text message with your verification code to the phone number ending with (*********45)',
      name: 'sendedatextverificationcodetothephone',
      desc: '',
      args: [],
    );
  }

  /// `Verify code`
  String get Verifycode {
    return Intl.message(
      'Verify code',
      name: 'Verifycode',
      desc: '',
      args: [],
    );
  }

  /// `Dont ''get the code?`
  String get Dontgetthecode {
    return Intl.message(
      'Dont \'\'get the code?',
      name: 'Dontgetthecode',
      desc: '',
      args: [],
    );
  }

  /// `Resend code`
  String get Resendcode {
    return Intl.message(
      'Resend code',
      name: 'Resendcode',
      desc: '',
      args: [],
    );
  }

  /// `Please confirm the password`
  String get Pleaseconfirmthepassword {
    return Intl.message(
      'Please confirm the password',
      name: 'Pleaseconfirmthepassword',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `Create new Password`
  String get CreatenewPassword {
    return Intl.message(
      'Create new Password',
      name: 'CreatenewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Category`
  String get Category {
    return Intl.message(
      'Category',
      name: 'Category',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get Offers {
    return Intl.message(
      'Offers',
      name: 'Offers',
      desc: '',
      args: [],
    );
  }

  /// `Buy Now`
  String get BuyNow {
    return Intl.message(
      'Buy Now',
      name: 'BuyNow',
      desc: '',
      args: [],
    );
  }

  /// `Courses to get srarted`
  String get Coursestogetsrarted {
    return Intl.message(
      'Courses to get srarted',
      name: 'Coursestogetsrarted',
      desc: '',
      args: [],
    );
  }

  /// `Featured courses`
  String get Featuredcourses {
    return Intl.message(
      'Featured courses',
      name: 'Featuredcourses',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get All {
    return Intl.message(
      'All',
      name: 'All',
      desc: '',
      args: [],
    );
  }

  /// `Tracking`
  String get Tracking {
    return Intl.message(
      'Tracking',
      name: 'Tracking',
      desc: '',
      args: [],
    );
  }

  /// `Related cources`
  String get Relatedcources {
    return Intl.message(
      'Related cources',
      name: 'Relatedcources',
      desc: '',
      args: [],
    );
  }

  /// `Verification code to your email`
  String get Verificationcodetoyouremail {
    return Intl.message(
      'Verification code to your email',
      name: 'Verificationcodetoyouremail',
      desc: '',
      args: [],
    );
  }

  /// `We will send verification code to yor email`
  String get Wewillsendverificationcodetoyoremail {
    return Intl.message(
      'We will send verification code to yor email',
      name: 'Wewillsendverificationcodetoyoremail',
      desc: '',
      args: [],
    );
  }

  /// ` Enter Your email`
  String get EnterYouremail {
    return Intl.message(
      ' Enter Your email',
      name: 'EnterYouremail',
      desc: '',
      args: [],
    );
  }

  /// `Send Verify`
  String get SendVerify {
    return Intl.message(
      'Send Verify',
      name: 'SendVerify',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
