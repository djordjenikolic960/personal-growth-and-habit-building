import '../../repository/user_repository.dart';
import 'get_user_name_use_case.dart';

class GetUserNameUseCaseImpl implements GetUserNameUseCase {
  final UserRepository _userRepository;

  GetUserNameUseCaseImpl(this._userRepository);

  @override
  Future<String?> get(String key) async {
    return await _userRepository.getUserName(key);
  }

}