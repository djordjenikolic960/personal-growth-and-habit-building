import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/model/habit.dart';
import '../../../data/model/habit_log.dart';
import '../../../domain/use_case/habit/get_all_habits_as_stream_use_case.dart';
import '../../../domain/use_case/habit/update_habit_use_case.dart';
import '../../extensions/date_time_extension.dart';
import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetAllHabitsAsStreamUseCase _getAllHabitsAsStreamUseCase;
  final UpdateHabitUseCase _updateHabitUseCase;

  StreamSubscription<List<Habit>>? _habitsSubscription;

  HomeBloc(
    this._getAllHabitsAsStreamUseCase,
    this._updateHabitUseCase,
  ) : super(HomeStateInitial()) {
    on<InitializeHabitsStream>(_onInitializeHabitsStream);
    on<EmitHabits>(_onEmitHabits);
    on<SelectDate>(_emitSelectDate);
    on<UpdateHabit>(_emitUpdateHabit);
  }

  @override
  Future<void> close() {
    _habitsSubscription?.cancel();
    return super.close();
  }

  FutureOr<void> _onInitializeHabitsStream(
    InitializeHabitsStream event,
    Emitter<HomeState> emit,
  ) {
    _habitsSubscription?.cancel();
    _habitsSubscription =
        _getAllHabitsAsStreamUseCase.getForDate(event.date).listen((habits) {
      if (!isClosed) {
        add(EmitHabits(habits, event.date));
      }
    }, onError: (error) {
      // todo handle error
    });
  }

  FutureOr<void> _onEmitHabits(
    EmitHabits event,
    Emitter<HomeState> emit,
  ) {
    emit(HomeStateInitial());
    emit(FetchHabitSuccess(
      event.habits,
      event.selectedDate,
    ));
  }

  FutureOr<void> _emitSelectDate(
    SelectDate event,
    Emitter<HomeState> emit,
  ) {
    add(InitializeHabitsStream(date: event.date));
  }

  FutureOr<void> _emitUpdateHabit(
    UpdateHabit event,
    Emitter<HomeState> emit,
  ) async {
    await _updateHabitUseCase.update(event.habit,
        HabitLog(date: DateTime.now().toDate, completed: event.isCompleted));
  }
}
