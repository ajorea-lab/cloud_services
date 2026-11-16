import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';

import 'firebase_options.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kDebugMode) {
    // TODO: Connect Authentication emulator
    FirebaseAuth.instance.useAuthEmulator(
      'localhost',
      8080
    );
  
    // TODO: Connect Firestore emulator
    FirebaseFirestore.instance.useFirestoreEmulator(
      'localhost',
      8080
    );
    // TODO: Connect Functions emulator
    FirebaseFunctions.instance.useFunctionsEmulator(
      'localhost',
      8080
    );
    // Android emulator uses 10.0.2.2
    // iOS simulator typically uses localhost
  }

  runApp(const CloudQuestApp());
}