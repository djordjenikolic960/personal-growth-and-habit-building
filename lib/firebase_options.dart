// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB04dr3t-Zf8PTEHUPuzO2Q74TGJsWWhT8',
    appId: '1:765090809514:web:312e834923ef743f68b2d3',
    messagingSenderId: '765090809514',
    projectId: 'personal-growth-and-habit',
    authDomain: 'personal-growth-and-habit.firebaseapp.com',
    storageBucket: 'personal-growth-and-habit.appspot.com',
    measurementId: 'G-1LT8M2QV7W',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBaLocCUMvEt6lOzzX8m_wCZT81l8hpn_o',
    appId: '1:765090809514:android:9b4260501bb00ef568b2d3',
    messagingSenderId: '765090809514',
    projectId: 'personal-growth-and-habit',
    storageBucket: 'personal-growth-and-habit.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBI9Tvo8C1fAGBhcq86Y0HQjZzlb2oi9hI',
    appId: '1:765090809514:ios:335b443ec524fc0568b2d3',
    messagingSenderId: '765090809514',
    projectId: 'personal-growth-and-habit',
    storageBucket: 'personal-growth-and-habit.appspot.com',
    iosBundleId: 'com.example.personalGrowthAndHabitBuilding',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBI9Tvo8C1fAGBhcq86Y0HQjZzlb2oi9hI',
    appId: '1:765090809514:ios:3f5882b6825027e468b2d3',
    messagingSenderId: '765090809514',
    projectId: 'personal-growth-and-habit',
    storageBucket: 'personal-growth-and-habit.appspot.com',
    iosBundleId: 'com.example.personalGrowthAndHabitBuilding.RunnerTests',
  );
}