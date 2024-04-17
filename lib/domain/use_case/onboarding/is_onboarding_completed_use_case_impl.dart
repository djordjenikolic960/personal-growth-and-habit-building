import '../../repository/preferences_repository.dart';
import 'is_onboarding_completed_use_case.dart';

class IsOnboardingCompletedUseCaseImpl implements IsOnboardingCompletedUseCase {
  final PreferencesRepository _preferencesRepository;

  IsOnboardingCompletedUseCaseImpl(this._preferencesRepository);

  @override
  Future<bool> isCompleted() async {
    return await _preferencesRepository.get<bool>("isOnboardingCompleted") ??
        false;
  }
}
