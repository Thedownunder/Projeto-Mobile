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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyAZ0FV6OD_Hlu3bcXdFqxiy05R17xv9FAE',
    appId: '1:269378323687:web:44d4b3f2b3011bce3b8e42',
    messagingSenderId: '269378323687',
    projectId: 'portal-noticias-mobile',
    authDomain: 'portal-noticias-mobile.firebaseapp.com',
    storageBucket: 'portal-noticias-mobile.appspot.com',
    measurementId: 'G-PWZ51W638E',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC3mzNTm8GsYE0G4IIC5SQzeqKiDCXObxg',
    appId: '1:269378323687:android:f521a929c6d5eb4a3b8e42',
    messagingSenderId: '269378323687',
    projectId: 'portal-noticias-mobile',
    storageBucket: 'portal-noticias-mobile.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAF7DK3by2u_yOvcH6cUojHvqvzTTz4vu8',
    appId: '1:269378323687:ios:4df28a243e2d50b03b8e42',
    messagingSenderId: '269378323687',
    projectId: 'portal-noticias-mobile',
    storageBucket: 'portal-noticias-mobile.appspot.com',
    iosBundleId: 'com.example.helloWorld',
  );

}