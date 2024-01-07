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
    apiKey: 'AIzaSyDw6ws8d4rSRJrx9ewox7iAhYG4PFqhNzE',
    appId: '1:763102490628:web:ef3e54375c2ed62de04551',
    messagingSenderId: '763102490628',
    projectId: 'flutter-bidan',
    authDomain: 'flutter-bidan.firebaseapp.com',
    storageBucket: 'flutter-bidan.appspot.com',
    measurementId: 'G-3HTGQ9Z900',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC2S8iVNOGB9eUB8n4lWGUnyPhSPcHN_Yc',
    appId: '1:763102490628:android:d7051ac90ec5d295e04551',
    messagingSenderId: '763102490628',
    projectId: 'flutter-bidan',
    storageBucket: 'flutter-bidan.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDNdFu2qgnrDpwsSXkh5-ouFyfmtc1bR9Q',
    appId: '1:763102490628:ios:13686f5ecd0397c9e04551',
    messagingSenderId: '763102490628',
    projectId: 'flutter-bidan',
    storageBucket: 'flutter-bidan.appspot.com',
    iosBundleId: 'com.example.bidan1',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDNdFu2qgnrDpwsSXkh5-ouFyfmtc1bR9Q',
    appId: '1:763102490628:ios:b05ad7784051affce04551',
    messagingSenderId: '763102490628',
    projectId: 'flutter-bidan',
    storageBucket: 'flutter-bidan.appspot.com',
    iosBundleId: 'com.example.bidan1.RunnerTests',
  );
}