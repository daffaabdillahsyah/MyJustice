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
    apiKey: 'AIzaSyAEuri_gREsYgx6xtpIGbFehpD8Ypl3Ias',
    appId: '1:337467263761:web:9bfa40d6d3b1e33c5bdab0',
    messagingSenderId: '337467263761',
    projectId: 'mylawyer2-70ede',
    authDomain: 'mylawyer2-70ede.firebaseapp.com',
    storageBucket: 'mylawyer2-70ede.appspot.com',
    measurementId: 'G-DLH8TKDPCQ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCj4x9NVeOSDESgII26DbtoLC6-CVb7BmE',
    appId: '1:337467263761:android:98e445c442c69ac85bdab0',
    messagingSenderId: '337467263761',
    projectId: 'mylawyer2-70ede',
    storageBucket: 'mylawyer2-70ede.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBjlw-fn5SwataJyVds4yb0Q6wNCfWneeI',
    appId: '1:337467263761:ios:095549ad2aa4abd25bdab0',
    messagingSenderId: '337467263761',
    projectId: 'mylawyer2-70ede',
    storageBucket: 'mylawyer2-70ede.appspot.com',
    iosBundleId: 'com.example.myjustice2',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBjlw-fn5SwataJyVds4yb0Q6wNCfWneeI',
    appId: '1:337467263761:ios:e7a324bf69cbe97a5bdab0',
    messagingSenderId: '337467263761',
    projectId: 'mylawyer2-70ede',
    storageBucket: 'mylawyer2-70ede.appspot.com',
    iosBundleId: 'com.example.myjustice2.RunnerTests',
  );
}
