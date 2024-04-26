import '../../../data/model/habit.dart';
import '../../../data/model/habit_log.dart';

abstract interface class UpdateHabitUseCase {
  Future<void> update(final Habit habit, final HabitLog habitLog);
}