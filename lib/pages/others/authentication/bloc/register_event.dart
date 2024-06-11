abstract class RegisterEvent {
  const RegisterEvent();
}
class  UsernameEvent extends RegisterEvent{
  final String username;
  const UsernameEvent(this.username);
}

class  emailEvent extends RegisterEvent{
  final String email;
  const emailEvent(this.email);
}

class  passwordEvent extends RegisterEvent{
  final String password;
  const passwordEvent(this.password);
}

class  ConfirmPasswordEvent extends RegisterEvent{
  final String confirmPassword;
  const ConfirmPasswordEvent(this.confirmPassword);
}