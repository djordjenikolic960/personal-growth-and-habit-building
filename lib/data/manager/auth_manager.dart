
abstract interface class AuthManager {
  Future<void> signInWithEmailAndPassword(String email, String password);

  Future<void> signUpWithEmailAndPassword(String email, String password);

  Future<void> signOut();
}
