import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDNOtEEb7_AEM5qRIReUJdqz3zDvmzGRGw",
            authDomain: "ab2024-c933d.firebaseapp.com",
            projectId: "ab2024-c933d",
            storageBucket: "ab2024-c933d.appspot.com",
            messagingSenderId: "344504945026",
            appId: "1:344504945026:web:7627e719d6b0b375dee79b"));
  } else {
    await Firebase.initializeApp();
  }
}
