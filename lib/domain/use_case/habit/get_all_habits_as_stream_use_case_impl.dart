import '../../../data/model/habit.dart';
import '../../repository/habit_repository.dart';
import 'get_all_habits_as_stream_use_case.dart';

class GetAllHabitsAsStreamUseCaseImpl implements GetAllHabitsAsStreamUseCase {
  final HabitRepository _habitRepository;

  GetAllHabitsAsStreamUseCaseImpl(this._habitRepository);

  @override
  Stream<List<Habit>> getForDate(DateTime date) {
    int dayIndex = date.weekday - 1;
    return _habitRepository.getAllAsStream().map((habits) {
      return habits.where((habit) {
        return habit.daysOfWeek[dayIndex];
      }).toList();
    });
  }
}
