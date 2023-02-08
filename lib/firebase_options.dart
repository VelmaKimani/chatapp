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
    apiKey: 'AIzaSyCOiKWUC81eaKjNHTaOXF2rhoKOoZnYfEM',
    appId: '1:322015655711:web:6742274896e3bb7c76a22a',
    messagingSenderId: '322015655711',
    projectId: 'chatapp-5a2a1',
    authDomain: 'chatapp-5a2a1.firebaseapp.com',
    storageBucket: 'chatapp-5a2a1.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAeSmj3cRn6I0Lj7b2ugf1oyF_X9YDoNmw',
    appId: '1:322015655711:android:b036f50a626fc7fc76a22a',
    messagingSenderId: '322015655711',
    projectId: 'chatapp-5a2a1',
    storageBucket: 'chatapp-5a2a1.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCiqIf5O0DZ0BbtqwUvfS_NRiBFWxaIjsM',
    appId: '1:322015655711:ios:433245c3993c000376a22a',
    messagingSenderId: '322015655711',
    projectId: 'chatapp-5a2a1',
    storageBucket: 'chatapp-5a2a1.appspot.com',
    iosClientId: '322015655711-6keluotg40hl1hft9ctavsh9cm1e3a8s.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCiqIf5O0DZ0BbtqwUvfS_NRiBFWxaIjsM',
    appId: '1:322015655711:ios:433245c3993c000376a22a',
    messagingSenderId: '322015655711',
    projectId: 'chatapp-5a2a1',
    storageBucket: 'chatapp-5a2a1.appspot.com',
    iosClientId: '322015655711-6keluotg40hl1hft9ctavsh9cm1e3a8s.apps.googleusercontent.com',
    iosBundleId: 'com.example.chatapp',
  );
}
