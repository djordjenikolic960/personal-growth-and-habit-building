import '../../../data/model/habit.dart';

abstract interface class GetAllHabitsUseCase {
  Future<List<Habit>> get();
}