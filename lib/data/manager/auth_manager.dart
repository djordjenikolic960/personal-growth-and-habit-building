import 'package:firebase_auth/firebase_auth.dart';

abstract interface class AuthManager {
  Future<void> signInWithEmailAndPassword(String email, String password);

  Future<void> signUpWithEmailAndPassword(String email, String password);

  Future<void> signOut();

  Stream<User?> authStateChanges();
}
