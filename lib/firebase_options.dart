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
    apiKey: 'AIzaSyC_6HB9xjjPN2miN-XPxu5YZWAYzLVF3CE',
    appId: '1:732888144372:web:29579a410f9bf640c4c1a1',
    messagingSenderId: '732888144372',
    projectId: 'neutritious-ca9c4',
    authDomain: 'neutritious-ca9c4.firebaseapp.com',
    storageBucket: 'neutritious-ca9c4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA0AUU0t4Jd6_EKcuxjlWgSA-fPSukmZGk',
    appId: '1:732888144372:android:d94b85c668233f48c4c1a1',
    messagingSenderId: '732888144372',
    projectId: 'neutritious-ca9c4',
    storageBucket: 'neutritious-ca9c4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCYodRBkH9fbpVYpBm2B7r3TVuKYYyPMNo',
    appId: '1:732888144372:ios:3b3da66a5a517ae2c4c1a1',
    messagingSenderId: '732888144372',
    projectId: 'neutritious-ca9c4',
    storageBucket: 'neutritious-ca9c4.appspot.com',
    iosBundleId: 'com.example.neutritious',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCYodRBkH9fbpVYpBm2B7r3TVuKYYyPMNo',
    appId: '1:732888144372:ios:38a9815186f0fb10c4c1a1',
    messagingSenderId: '732888144372',
    projectId: 'neutritious-ca9c4',
    storageBucket: 'neutritious-ca9c4.appspot.com',
    iosBundleId: 'com.example.neutritious.RunnerTests',
  );
}