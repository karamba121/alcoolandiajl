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
    apiKey: 'AIzaSyCARzYRRAQDq0B-_aGMW8jco7Ay9Nf4kNQ',
    appId: '1:451952795764:web:c636b3ed3c253a7e5d3121',
    messagingSenderId: '451952795764',
    projectId: 'alcoolandiajl',
    authDomain: 'alcoolandiajl.firebaseapp.com',
    storageBucket: 'alcoolandiajl.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCgLZimi2cv_LdY2XtTc8FaB-SzhMC3Iwk',
    appId: '1:451952795764:android:8b5c05a26fce315e5d3121',
    messagingSenderId: '451952795764',
    projectId: 'alcoolandiajl',
    storageBucket: 'alcoolandiajl.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyADjCELBDGPuHx8F5Fpxd04iZ0u2hOUBBY',
    appId: '1:451952795764:ios:cc701b072e3455475d3121',
    messagingSenderId: '451952795764',
    projectId: 'alcoolandiajl',
    storageBucket: 'alcoolandiajl.appspot.com',
    iosBundleId: 'com.example.alcoolandiajl',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyADjCELBDGPuHx8F5Fpxd04iZ0u2hOUBBY',
    appId: '1:451952795764:ios:22ce71eb17b3fc135d3121',
    messagingSenderId: '451952795764',
    projectId: 'alcoolandiajl',
    storageBucket: 'alcoolandiajl.appspot.com',
    iosBundleId: 'com.example.alcoolandiajl.RunnerTests',
  );
}
