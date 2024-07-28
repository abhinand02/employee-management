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
    apiKey: 'AIzaSyBAjQh3BeIdKwwftCNzbHle65SZnwPNt1Y',
    appId: '1:828698480917:web:ad77b9c0335aa7f099991c',
    messagingSenderId: '828698480917',
    projectId: 'employee-management-b414c',
    authDomain: 'employee-management-b414c.firebaseapp.com',
    storageBucket: 'employee-management-b414c.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB5mHRUV-JP921DcOkU93soiUUoQysOzTo',
    appId: '1:828698480917:android:dcb56283efb525d599991c',
    messagingSenderId: '828698480917',
    projectId: 'employee-management-b414c',
    storageBucket: 'employee-management-b414c.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBQiPkhkwUXNhLIAIMTArO31oCDE17LN7w',
    appId: '1:828698480917:ios:47bf7bf78e85520399991c',
    messagingSenderId: '828698480917',
    projectId: 'employee-management-b414c',
    storageBucket: 'employee-management-b414c.appspot.com',
    iosBundleId: 'com.example.employeeManagement',
  );
}