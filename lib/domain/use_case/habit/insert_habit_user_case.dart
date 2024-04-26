import '../../../data/model/habit.dart';

abstract interface class InsertHabitUseCase {
  Future<void> insert(final Habit habit);
}