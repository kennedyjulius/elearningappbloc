// app_event.dart
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AppEvent {
  const AppEvent();
}

class TriggerAppEvent extends AppEvent {
  final int index;
  const TriggerAppEvent(this.index);
}

// app_state.dart


class AppState extends Equatable {
  final int currentIndex;

  const AppState({this.currentIndex = 0});

  AppState copyWith({int? currentIndex}) {
    return AppState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }

  @override
  List<Object> get props => [currentIndex];
}

// app_blocs.dart


class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(const AppState()) {
    on<TriggerAppEvent>(_onTriggerAppEvent);
  }

  void _onTriggerAppEvent(TriggerAppEvent event, Emitter<AppState> emit) {
    emit(state.copyWith(currentIndex: event.index));
  }
}
