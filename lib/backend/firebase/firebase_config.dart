import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBryIdR60Irp8ci7LS2t1yK9JO5_7S6slU",
            authDomain: "yaqada-a.firebaseapp.com",
            projectId: "yaqada-a",
            storageBucket: "yaqada-a.firebasestorage.app",
            messagingSenderId: "864916292024",
            appId: "1:864916292024:web:98cea26ce86d38eb664f4d"));
  } else {
    await Firebase.initializeApp();
  }
}
