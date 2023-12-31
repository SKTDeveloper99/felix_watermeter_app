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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA4JirS3CzjGEx3rWOTXic5RFkO3Hqiv_U',
    appId: '1:257978860729:android:200dbd5d98c4b73aa38768',
    messagingSenderId: '257978860729',
    projectId: 'khoatrancodingminds',
    databaseURL: 'https://khoatrancodingminds-default-rtdb.firebaseio.com',
    storageBucket: 'khoatrancodingminds.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCGV-HQEgyBZxRilD-3IftsEUbQ72CWMt0',
    appId: '1:257978860729:ios:c3676122a9861e92a38768',
    messagingSenderId: '257978860729',
    projectId: 'khoatrancodingminds',
    databaseURL: 'https://khoatrancodingminds-default-rtdb.firebaseio.com',
    storageBucket: 'khoatrancodingminds.appspot.com',
    androidClientId: '257978860729-h9i3ishb31gtmkh5fp8ckhdjss354435.apps.googleusercontent.com',
    iosClientId: '257978860729-8109h0b6p9giq3gvc2h3pju0tpnfm39d.apps.googleusercontent.com',
    iosBundleId: 'com.felixsoftware.felixWatermeterApp',
  );
}
