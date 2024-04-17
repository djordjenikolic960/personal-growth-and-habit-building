import '../../repository/preferences_repository.dart';
import 'complete_onboarding_use_case.dart';

class CompleteOnboardingUseCaseImpl implements CompleteOnboardingUseCase {
  final PreferencesRepository _preferencesRepository;

  CompleteOnboardingUseCaseImpl(this._preferencesRepository);

  @override
  Future<void> complete() async {
    await _preferencesRepository.save<bool>("isOnboardingCompleted", true);
  }
}
