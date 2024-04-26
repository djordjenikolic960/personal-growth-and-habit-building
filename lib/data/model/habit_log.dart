import 'package:hive/hive.dart';
part 'habit_log.g.dart';

@HiveType(typeId: 1)
class HabitLog {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final bool completed;

  HabitLog({
    required this.date,
    required this.completed,
  });
}
