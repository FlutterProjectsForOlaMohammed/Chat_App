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
    apiKey: 'AIzaSyDenZuz_71IPG6QXyHQlluin0n4OgpJa6o',
    appId: '1:776305025593:web:31b68c04adb6cda059a3e8',
    messagingSenderId: '776305025593',
    projectId: 'chat-app-for-test-a6f55',
    authDomain: 'chat-app-for-test-a6f55.firebaseapp.com',
    storageBucket: 'chat-app-for-test-a6f55.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBlvRS7QgHWBh73P7J7xmZiXrixn1gv1r0',
    appId: '1:776305025593:android:8e6f3c99504bfb3d59a3e8',
    messagingSenderId: '776305025593',
    projectId: 'chat-app-for-test-a6f55',
    storageBucket: 'chat-app-for-test-a6f55.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD9ooQJEpKfN_wEjeKOs9NcrLu41__VJcE',
    appId: '1:776305025593:ios:6b6b537e337b1df959a3e8',
    messagingSenderId: '776305025593',
    projectId: 'chat-app-for-test-a6f55',
    storageBucket: 'chat-app-for-test-a6f55.appspot.com',
    iosClientId: '776305025593-uf4chcsg50ihpfo098puqolrk55m3fn6.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatappfortest',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD9ooQJEpKfN_wEjeKOs9NcrLu41__VJcE',
    appId: '1:776305025593:ios:ee31e93ba315229b59a3e8',
    messagingSenderId: '776305025593',
    projectId: 'chat-app-for-test-a6f55',
    storageBucket: 'chat-app-for-test-a6f55.appspot.com',
    iosClientId: '776305025593-ia9nmcfs549t2d2dm31i5jsird7b1mp4.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatappfortest.RunnerTests',
  );
}
