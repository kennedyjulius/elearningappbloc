

import 'package:elearning_app_bloc/pages/others/authentication/bloc/home_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocks extends Bloc<AppEvent, AppState> {
  AppBlocks():super(const AppState()) {
    on<TriggerAppEvent>((event, emit) {
      emit(AppState(currentIndex: event.index));
    });
  }
}
