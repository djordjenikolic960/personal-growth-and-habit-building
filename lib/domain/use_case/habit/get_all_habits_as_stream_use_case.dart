import '../../../data/model/habit.dart';

abstract interface class GetAllHabitsAsStreamUseCase {
  Stream<List<Habit>> getForDate(DateTime date);
}