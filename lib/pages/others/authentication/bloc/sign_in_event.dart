import 'package:equatable/equatable.dart';

abstract class SignInEvent extends Equatable {
  const SignInEvent();
  
  @override
  List<Object?> get props => [];
}

class EmailEvent extends SignInEvent {
  final String email;
  const EmailEvent(this.email);

  @override
  List<Object?> get props => [email];
}

class PasswordEvent extends SignInEvent {
  final String password;
  const PasswordEvent(this.password);

  @override
  List<Object?> get props => [password];
}
