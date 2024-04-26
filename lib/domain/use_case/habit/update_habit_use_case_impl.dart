
import 'package:collection/collection.dart';

import '../../../data/model/habit.dart';
import '../../../data/model/habit_log.dart';
import '../../../presentation/extensions/date_time_extension.dart';
import '../../repository/habit_repository.dart';
import 'update_habit_use_case.dart';

class UpdateHabitUseCaseImpl implements UpdateHabitUseCase {
  final HabitRepository _habitRepository;

  UpdateHabitUseCaseImpl(this._habitRepository);

  @override
  Future<void> update(Habit habit, HabitLog habitLog) async {
    final newLogDate = habitLog.date.toDate.toString();

    final existingLog = habit.logs.firstWhereOrNull(
      (log) => log.date.toDate.toString() == newLogDate,
    );

    if (existingLog != null) {
      final index = habit.logs.indexOf(existingLog);
      habit.logs[index] = habitLog;
    } else {
      habit.logs.add(habitLog);
    }

    await _habitRepository.updateHabit(habit);
  }
}
