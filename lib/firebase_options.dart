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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyB8sO29OveZHL6l2SwHi7e6L6wm6sGa80w',
    appId: '1:563601976176:android:b67173d7799abf4bb47db5',
    messagingSenderId: '563601976176',
    projectId: 'flutter-project-18f6f',
    storageBucket: 'flutter-project-18f6f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC6BVEbMesIUyh7C-JL08aVORPAkXpaRdQ',
    appId: '1:563601976176:ios:c78300bc52d1b468b47db5',
    messagingSenderId: '563601976176',
    projectId: 'flutter-project-18f6f',
    storageBucket: 'flutter-project-18f6f.appspot.com',
    iosClientId: '563601976176-9s54egl1ksruid1fdgsaj60u8lbdk3h7.apps.googleusercontent.com',
    iosBundleId: 'c',
  );
}