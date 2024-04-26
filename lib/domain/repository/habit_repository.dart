import '../../data/model/habit.dart';

abstract interface class HabitRepository {

  Future<List<Habit>> getAll();

  Future<void> insertHabit(Habit habit);

  Stream<List<Habit>> getAllAsStream();

  Future<void> updateHabit(Habit habit);
}