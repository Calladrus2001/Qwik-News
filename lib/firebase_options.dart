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
    apiKey: 'AIzaSyC1PvYpgVIM9VtBq1leO4lOY8y7hl6Un9w',
    appId: '1:243594470231:web:3c0a7393e0276e593a5412',
    messagingSenderId: '243594470231',
    projectId: 'cometlabs-57723',
    authDomain: 'cometlabs-57723.firebaseapp.com',
    storageBucket: 'cometlabs-57723.appspot.com',
    measurementId: 'G-RHDY4LFWHP',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDSYHe3hOngCUNOJzLGibFIzhPuUW5chc4',
    appId: '1:243594470231:android:96dcb2a951eafc9c3a5412',
    messagingSenderId: '243594470231',
    projectId: 'cometlabs-57723',
    storageBucket: 'cometlabs-57723.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcXfIo8uZY9UkiNUrsc_pIFz9oTQUqC1o',
    appId: '1:243594470231:ios:e063a85ba2d0f5d43a5412',
    messagingSenderId: '243594470231',
    projectId: 'cometlabs-57723',
    storageBucket: 'cometlabs-57723.appspot.com',
    iosClientId: '243594470231-4hi8puuua5igppbcia7vd242gir9o56l.apps.googleusercontent.com',
    iosBundleId: 'com.example.cometLabsTask',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcXfIo8uZY9UkiNUrsc_pIFz9oTQUqC1o',
    appId: '1:243594470231:ios:e063a85ba2d0f5d43a5412',
    messagingSenderId: '243594470231',
    projectId: 'cometlabs-57723',
    storageBucket: 'cometlabs-57723.appspot.com',
    iosClientId: '243594470231-4hi8puuua5igppbcia7vd242gir9o56l.apps.googleusercontent.com',
    iosBundleId: 'com.example.cometLabsTask',
  );
}
