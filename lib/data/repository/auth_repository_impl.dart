import '../../domain/repository/auth_repository.dart';
import '../manager/auth_manager.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthManager _authManager;

  AuthRepositoryImpl(this._authManager);

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await _authManager.signInWithEmailAndPassword(email, password);
  }

  @override
  Future<void> signOut() async {
    await _authManager.signOut();
  }

  @override
  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    await _authManager.signUpWithEmailAndPassword(email, password);
  }
}
