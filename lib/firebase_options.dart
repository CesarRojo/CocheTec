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
    apiKey: 'AIzaSyBpQ1QK65zjL8PbOD3616JBNL7VItjTSNU',
    appId: '1:789356467732:web:6338d932d5c5ec83e5f901',
    messagingSenderId: '789356467732',
    projectId: 'proyecto1-c81a8',
    authDomain: 'proyecto1-c81a8.firebaseapp.com',
    storageBucket: 'proyecto1-c81a8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDlpmC6jX9AcFOinrTCR-lA6fEdQvq4Za8',
    appId: '1:789356467732:android:997f7a8826cd2e78e5f901',
    messagingSenderId: '789356467732',
    projectId: 'proyecto1-c81a8',
    storageBucket: 'proyecto1-c81a8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAbwTmqdkQnfC22xAFnJPwgTLg1o1AWeBw',
    appId: '1:789356467732:ios:d063620c7ebad4d9e5f901',
    messagingSenderId: '789356467732',
    projectId: 'proyecto1-c81a8',
    storageBucket: 'proyecto1-c81a8.appspot.com',
    iosClientId: '789356467732-p73784fm0ub412v95sht0f637k20qrg6.apps.googleusercontent.com',
    iosBundleId: 'com.example.damU4Proyecto119400664',
  );
}
