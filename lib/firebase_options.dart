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
    apiKey: 'AIzaSyD4E_Bx3HpO9y__ieQn99h4bTJ_UkJRLm0',
    appId: '1:848862581518:web:8fa2916965eaf7a9387d5f',
    messagingSenderId: '848862581518',
    projectId: 'tankyu-app',
    authDomain: 'tankyu-app.firebaseapp.com',
    storageBucket: 'tankyu-app.appspot.com',
    measurementId: 'G-F285PKSSM1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB9_8g4jOv4Uq7wIKrejTFqioPhVoNYgo0',
    appId: '1:848862581518:android:a5c5e65017482a5b387d5f',
    messagingSenderId: '848862581518',
    projectId: 'tankyu-app',
    storageBucket: 'tankyu-app.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyA8ahACDoQsYHf4i7cQkIg54KAxyG29nEQ',
    appId: '1:848862581518:ios:d0e6afb4c282eef9387d5f',
    messagingSenderId: '848862581518',
    projectId: 'tankyu-app',
    storageBucket: 'tankyu-app.appspot.com',
    iosClientId: '848862581518-c73uvqaavqbkje0fo6tva67a2rf678ks.apps.googleusercontent.com',
    iosBundleId: 'com.example.kenryoTankyu',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyA8ahACDoQsYHf4i7cQkIg54KAxyG29nEQ',
    appId: '1:848862581518:ios:62b965b6d97cc007387d5f',
    messagingSenderId: '848862581518',
    projectId: 'tankyu-app',
    storageBucket: 'tankyu-app.appspot.com',
    iosClientId: '848862581518-9gbgujfl84h5j7260grv0ip70itq8q8o.apps.googleusercontent.com',
    iosBundleId: 'com.example.kenryoTankyu.RunnerTests',
  );
}