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
    apiKey: 'AIzaSyAK8qJlQDRdbaJQOiAnZTC1OzvUa81tgWw',
    appId: '1:762873281931:web:870c99549a11c07958438e',
    messagingSenderId: '762873281931',
    projectId: 'mudanzaya-3b7d0',
    authDomain: 'mudanzaya-3b7d0.firebaseapp.com',
    storageBucket: 'mudanzaya-3b7d0.appspot.com',
    measurementId: 'G-5PF2N6JBDZ',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBiRvVaH4XQHumz2yXnaCOCYhrtU48bP_0',
    appId: '1:762873281931:android:93754adac68a36e058438e',
    messagingSenderId: '762873281931',
    projectId: 'mudanzaya-3b7d0',
    storageBucket: 'mudanzaya-3b7d0.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDbDUUmrAh2dCncQq-kNe5ASldfmYxnC-M',
    appId: '1:762873281931:ios:a9794f5d459da24658438e',
    messagingSenderId: '762873281931',
    projectId: 'mudanzaya-3b7d0',
    storageBucket: 'mudanzaya-3b7d0.appspot.com',
    iosBundleId: 'com.lasthuman.mudanzaya',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDbDUUmrAh2dCncQq-kNe5ASldfmYxnC-M',
    appId: '1:762873281931:ios:01a768748e74afe558438e',
    messagingSenderId: '762873281931',
    projectId: 'mudanzaya-3b7d0',
    storageBucket: 'mudanzaya-3b7d0.appspot.com',
    iosBundleId: 'com.lasthuman.mudanzaya.RunnerTests',
  );
}
