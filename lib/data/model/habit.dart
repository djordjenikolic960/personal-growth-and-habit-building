import 'package:hive/hive.dart';

import '../../common/constant/constant.dart';
import 'habit_log.dart';

part 'habit.g.dart';

@HiveType(typeId: 0)
class Habit extends HiveObject {
  @HiveField(0)
  final String title;

  @HiveField(1)
  final List<bool> daysOfWeek;

  @HiveField(2)
  final bool reminderOn;

  @HiveField(3)
  final String? reminderTime;

  @HiveField(4)
  final List<HabitLog> logs;

  Habit({
    required this.title,
    required this.daysOfWeek,
    required this.logs,
    this.reminderOn = false,
    this.reminderTime,
  });

  Habit.empty()
      : title = Constant.emptyString,
        daysOfWeek = [true, true, true, true, true, true, true],
        reminderOn = false,
        reminderTime = Constant.emptyString,
        logs = [];

  Habit copyWith({
    String? title,
    List<bool>? daysOfWeek,
    bool? reminderOn,
    String? reminderTime,
    List<HabitLog>? logs,
  }) {
    return Habit(
      title: title ?? this.title,
      daysOfWeek: daysOfWeek ?? this.daysOfWeek,
      reminderOn: reminderOn ?? this.reminderOn,
      reminderTime: reminderTime ?? this.reminderTime,
      logs: logs ?? this.logs,
    );
  }

  bool isDueOn(int dayOfWeek) {
    return daysOfWeek[dayOfWeek];
  }
}
