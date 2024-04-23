import '../../entity/user.dart';

abstract interface class GetUserStreamUseCase {
  Stream<User?> get();
}
