import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:elearning_app_bloc/pages/others/authentication/bloc/sign_in_event.dart';
import 'package:elearning_app_bloc/pages/others/authentication/bloc/sign_in_state.dart';

// Define the SignInBloc class extending Bloc with SignInEvent and SignInState
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  // Constructor initializing the bloc with the initial state
  SignInBloc() : super(const SignInState()) {
    // Handling EmailEvent
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passwordEvent);
  }
  void _emailEvent(EmailEvent event, Emitter<SignInState> emit){
    emit(state.copyWith(email: event.email));
  }

    void _passwordEvent(PasswordEvent event, Emitter<SignInState> emit){
    emit(state.copyWith(password: event.password));
  }
}
