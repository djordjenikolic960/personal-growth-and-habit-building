import '../../entity/user.dart';
import '../../repository/user_repository.dart';
import 'get_user_stream_use_case.dart';

class GetUserStreamUseCaseImpl implements GetUserStreamUseCase {
  final UserRepository _userRepository;

  GetUserStreamUseCaseImpl(this._userRepository);

  @override
  Stream<User?> get() {
    return _userRepository.user;
  }

}