import 'package:elearning_app_bloc/pages/others/authentication/bloc/register_event.dart';
import 'package:elearning_app_bloc/pages/others/authentication/bloc/register_state.dart';
import 'package:elearning_app_bloc/pages/others/authentication/bloc/sign_in_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBlocs extends Bloc<RegisterEvent, RegisterStates> {
  
  RegisterBlocs() : super(const RegisterStates()) {
    on<UsernameEvent>(_usernameEvent);
    on<emailEvent>(_emailEvent as EventHandler<emailEvent, RegisterStates>);
    on<passwordEvent>(_passwordEvent as EventHandler<passwordEvent, RegisterStates>);
    on<ConfirmPasswordEvent>(_confirmPasswordEvent);
  }

  void _usernameEvent(UsernameEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(username: event.username));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(email: event.email));
  }

  void _passwordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(password: event.password));
  }

  void _confirmPasswordEvent(ConfirmPasswordEvent event, Emitter<RegisterStates> emit) {
    emit(state.copyWith(confirmPassword: event.confirmPassword));
  }
}
