// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyARcHXOR4y79KA6f5xN3M3w4qt27KxUCAs',
    appId: '1:175162463752:web:1c8f4e748010d2ab49e3bd',
    messagingSenderId: '175162463752',
    projectId: 'study-path-75d84',
    authDomain: 'study-path-75d84.firebaseapp.com',
    storageBucket: 'study-path-75d84.appspot.com',
    measurementId: 'G-JRGQ6JK63B',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA-JG-uQL8AMnqCqRzklDCRDOOw0YeLY3I',
    appId: '1:175162463752:android:9bc9096127e1cf7e49e3bd',
    messagingSenderId: '175162463752',
    projectId: 'study-path-75d84',
    storageBucket: 'study-path-75d84.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDhBBCBjde9kl6PIU3yOq_4AnCraT9UWDU',
    appId: '1:175162463752:ios:32374ecd9966e0a049e3bd',
    messagingSenderId: '175162463752',
    projectId: 'study-path-75d84',
    storageBucket: 'study-path-75d84.appspot.com',
    iosClientId: '175162463752-lp5s81gastsl7b5p08mjf20ccqsatua4.apps.googleusercontent.com',
    iosBundleId: 'com.example.studyPath',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDhBBCBjde9kl6PIU3yOq_4AnCraT9UWDU',
    appId: '1:175162463752:ios:32374ecd9966e0a049e3bd',
    messagingSenderId: '175162463752',
    projectId: 'study-path-75d84',
    storageBucket: 'study-path-75d84.appspot.com',
    iosClientId: '175162463752-lp5s81gastsl7b5p08mjf20ccqsatua4.apps.googleusercontent.com',
    iosBundleId: 'com.example.studyPath',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyARcHXOR4y79KA6f5xN3M3w4qt27KxUCAs',
    appId: '1:175162463752:web:f1b3a7fb1b98db5a49e3bd',
    messagingSenderId: '175162463752',
    projectId: 'study-path-75d84',
    authDomain: 'study-path-75d84.firebaseapp.com',
    storageBucket: 'study-path-75d84.appspot.com',
    measurementId: 'G-ZD73D07LJ5',
  );
}