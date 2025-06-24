import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyDiqzO5ZYjgf1RhXZfkdtn1uVHEgxTnM2M",
            authDomain: "sistema-nutri-85xb6d.firebaseapp.com",
            projectId: "sistema-nutri-85xb6d",
            storageBucket: "sistema-nutri-85xb6d.appspot.com",
            messagingSenderId: "916804180672",
            appId: "1:916804180672:web:e1f76560220dbec759eb25"));
  } else {
    await Firebase.initializeApp();
  }
}
