import '../../../data/model/habit.dart';
import '../../repository/habit_repository.dart';
import 'insert_habit_user_case.dart';

class InsertHabitUseCaseImpl implements InsertHabitUseCase {
  final HabitRepository _habitRepository;

  InsertHabitUseCaseImpl(this._habitRepository);

  @override
  Future<void> insert(Habit habit) async {
   await _habitRepository.insertHabit(habit);
  }

}