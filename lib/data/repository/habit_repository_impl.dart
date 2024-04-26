import '../model/habit.dart';

import '../../domain/repository/habit_repository.dart';
import '../manager/database_manager.dart';
import '../model/habit_log.dart';

class HabitRepositoryImpl implements HabitRepository {
  final DatabaseManager<Habit> _databaseManager;

  static const _habitTable = "habit";

  HabitRepositoryImpl(this._databaseManager);

  @override
  Future<List<Habit>> getAll() async {
    return _databaseManager.getAll(_habitTable);
  }

  @override
  Future<void> insertHabit(Habit habit) async {
    return _databaseManager.insert(_habitTable, habit);
  }

  @override
  Stream<List<Habit>> getAllAsStream() {
    return _databaseManager.getAllAsStream();
  }

  @override
  Future<void> updateHabit(Habit habit) async {
    await _databaseManager.update(habit.key, habit);
  }
}
