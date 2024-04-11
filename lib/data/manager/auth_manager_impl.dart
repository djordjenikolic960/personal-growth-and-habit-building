import 'package:firebase_auth/firebase_auth.dart';

import 'auth_manager.dart';

class AuthManagerImpl implements AuthManager {
  final FirebaseAuth _firebaseAuth;

  AuthManagerImpl(this._firebaseAuth);

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }
}
