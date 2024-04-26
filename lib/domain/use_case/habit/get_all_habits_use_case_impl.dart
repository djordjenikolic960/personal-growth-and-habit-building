import '../../../data/model/habit.dart';
import '../../repository/habit_repository.dart';
import 'get_all_habits_use_case.dart';

class GetAllHabitsUseCaseImpl implements GetAllHabitsUseCase {
  final HabitRepository _habitRepository;

  GetAllHabitsUseCaseImpl(this._habitRepository);

  @override
  Future<List<Habit>> get() async {
    return await _habitRepository.getAll();
  }
}
