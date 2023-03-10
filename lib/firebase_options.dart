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
    apiKey: 'AIzaSyDrs5-zuvQodgTkD_7kms-n4IJZXM4OvCg',
    appId: '1:1047289904410:android:3ef422d0ba3190949840a3',
    messagingSenderId: '1047289904410',
    projectId: 'chatapp-c37e4',
    storageBucket: 'chatapp-c37e4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAIjkIGlLorctGxBWf6BkqPz7etHFHenKI',
    appId: '1:1047289904410:ios:72d12bafd0b476bd9840a3',
    messagingSenderId: '1047289904410',
    projectId: 'chatapp-c37e4',
    storageBucket: 'chatapp-c37e4.appspot.com',
    androidClientId: '1047289904410-ej92l9e8hha2hm7i233rlfgpv3cbnnci.apps.googleusercontent.com',
    iosClientId: '1047289904410-26td88rkg7ev4h4uf4a2vg1l448s0te7.apps.googleusercontent.com',
    iosBundleId: 'com.example.deliveryli',
  );
}
