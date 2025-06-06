// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        print('the android is yeeeees');
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDP1RcCaibuE8bImrdvf913ri4CCuI4mZ0',
    appId: '1:546579719450:android:550d5af1870523b3d0b8a3',
    messagingSenderId: '546579719450',
    projectId: 'manjam-9c864',
    storageBucket: 'manjam-9c864.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEUbisqwX3BdPM96zc0Nh-r5l7X6D9naE',
    appId: '1:546579719450:ios:0cd17638a8fea5a6d0b8a3',
    messagingSenderId: '546579719450',
    projectId: 'manjam-9c864',
    storageBucket: 'manjam-9c864.firebasestorage.app',
    iosBundleId: 'com.almaany.manjamasmaa.manjamAsmaa',
  );
}
