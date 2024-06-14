

import 'package:elearning_app_bloc/pages/others/authentication/bloc/home_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs():super(const AppState()) {
    on<TriggerAppEvent>((event, emit) {
      emit(AppState(currentIndex: event.index));
    });
  }
}
