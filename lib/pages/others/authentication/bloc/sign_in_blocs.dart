import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elearning_app_bloc/pages/others/authentication/bloc/sign_in_event.dart';
import 'package:elearning_app_bloc/pages/others/authentication/bloc/sign_in_state.dart';

// Define the SignInBloc class extending Bloc with SignInEvent and SignInState
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  // Constructor initializing the bloc with the initial state
  SignInBloc() : super(const SignInState()) {
    // Handling EmailEvent
    on<EmailEvent>((event, emit) {
      // Update the state with the new email
      emit(state.copyWith(email: event.email));
    });

    // Handling PasswordEvent
    on<PasswordEvent>((event, emit) {
      // Update the state with the new password
      emit(state.copyWith(password: event.password));
    });
  }
}
