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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBfWKzwZSVBPccD-ersE8ANgvgt0oah1Eo',
    appId: '1:1056674609768:web:c1997534aed48bec2999dd',
    messagingSenderId: '1056674609768',
    projectId: 'infotrack-114ef',
    authDomain: 'infotrack-114ef.firebaseapp.com',
    storageBucket: 'infotrack-114ef.appspot.com',
    measurementId: 'G-HZK53VST8D',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDeHXVDXl7SH4EspOpAk-l_pu_RHNKnj9c',
    appId: '1:1056674609768:android:bebe2e6de7ae4f792999dd',
    messagingSenderId: '1056674609768',
    projectId: 'infotrack-114ef',
    storageBucket: 'infotrack-114ef.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAiWlOYRwYzMOpHkQmp3jNLxGv6PPVkQ5g',
    appId: '1:1056674609768:ios:08d7a22be08296942999dd',
    messagingSenderId: '1056674609768',
    projectId: 'infotrack-114ef',
    storageBucket: 'infotrack-114ef.appspot.com',
    iosBundleId: 'com.example.infotrack',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAiWlOYRwYzMOpHkQmp3jNLxGv6PPVkQ5g',
    appId: '1:1056674609768:ios:08d7a22be08296942999dd',
    messagingSenderId: '1056674609768',
    projectId: 'infotrack-114ef',
    storageBucket: 'infotrack-114ef.appspot.com',
    iosBundleId: 'com.example.infotrack',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBfWKzwZSVBPccD-ersE8ANgvgt0oah1Eo',
    appId: '1:1056674609768:web:e887073fa58fb00d2999dd',
    messagingSenderId: '1056674609768',
    projectId: 'infotrack-114ef',
    authDomain: 'infotrack-114ef.firebaseapp.com',
    storageBucket: 'infotrack-114ef.appspot.com',
    measurementId: 'G-2SM9BZZE8X',
  );
}
