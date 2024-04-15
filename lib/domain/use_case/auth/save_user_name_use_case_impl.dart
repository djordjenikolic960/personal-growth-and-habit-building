import '../../repository/user_repository.dart';
import 'save_user_name_use_case.dart';

class SaveUserUserNameUseCaseImpl implements SaveUserNameUseCase {
  final UserRepository _userRepository;

  SaveUserUserNameUseCaseImpl(this._userRepository);

  @override
  Future<void> save(final String name) async {
    await _userRepository.saveUserName(name);
  }
}
