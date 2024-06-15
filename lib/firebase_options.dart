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
    apiKey: 'AIzaSyA14RsTCPssxbZBUuGOCIokviT-j7A6seo',
    appId: '1:557834623234:web:9e075cd484eac649da8a1b',
    messagingSenderId: '557834623234',
    projectId: 'carhelp-74d36',
    authDomain: 'carhelp-74d36.firebaseapp.com',
    storageBucket: 'carhelp-74d36.appspot.com',
    measurementId: 'G-ZKWN8ND32V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCSBTNCZmlREeQxrpm_TZGZ3Df81e9pO8w',
    appId: '1:557834623234:android:f8bd2670c66beec3da8a1b',
    messagingSenderId: '557834623234',
    projectId: 'carhelp-74d36',
    storageBucket: 'carhelp-74d36.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDPGTWt6mNwbmbmhY1brHWDs2JMtR4RTV8',
    appId: '1:557834623234:ios:eeeb31f718ae69b0da8a1b',
    messagingSenderId: '557834623234',
    projectId: 'carhelp-74d36',
    storageBucket: 'carhelp-74d36.appspot.com',
    iosBundleId: 'com.example.carhelp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDPGTWt6mNwbmbmhY1brHWDs2JMtR4RTV8',
    appId: '1:557834623234:ios:eeeb31f718ae69b0da8a1b',
    messagingSenderId: '557834623234',
    projectId: 'carhelp-74d36',
    storageBucket: 'carhelp-74d36.appspot.com',
    iosBundleId: 'com.example.carhelp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA14RsTCPssxbZBUuGOCIokviT-j7A6seo',
    appId: '1:557834623234:web:aec8aa72d59d736ada8a1b',
    messagingSenderId: '557834623234',
    projectId: 'carhelp-74d36',
    authDomain: 'carhelp-74d36.firebaseapp.com',
    storageBucket: 'carhelp-74d36.appspot.com',
    measurementId: 'G-B608VZBZBZ',
  );
}