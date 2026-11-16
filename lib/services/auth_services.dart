import 'package:firebase_auth/firebase_auth.dart';

final auth = FirebaseAuth.instance;

Future<UserCredential> register(
    String email,
    String password,
    ) =>
    auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

Future<UserCredential> signIn(
    String email,
    String password,
    ) =>
    auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

Future<void> logOut() =>
    auth.signOut();

// TODO: Convert FirebaseAuthException
// into user-friendly messages

// TODO: Validate email format

// TODO: Validate password requirements

// TODO: Surface authentication errors safely