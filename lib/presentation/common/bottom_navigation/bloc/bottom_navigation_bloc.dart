import '../screen.dart';
import 'bottom_navigation_event.dart';
import 'bottom_navigation_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavigationBloc
    extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationSelectedScreen(Screen.home)) {
    on<TabChanged>(_emitTabChanged);
  }

  void _emitTabChanged(
    TabChanged event,
    Emitter<BottomNavigationState> emit,
  ) {
    emit(BottomNavigationSelectedScreen(event.selectedScreen));
  }
}
