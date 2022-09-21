import 'dart:async';

import 'package:sola/validator/auth.validator.dart';

class LoginBloc {
  final StreamController _emailController = StreamController();
  final StreamController _passwordController = StreamController();

  Stream get emailStream => _emailController.stream;
  Stream get passwordStream => _passwordController.stream;

  bool isValid(String email, String password) {
    Output emailValidator = AuthValidator.emailValidator(email);
    Output passwordValidator = AuthValidator.passwordValidator(password);
    if (!emailValidator.isValid) {
      _emailController.sink.addError(emailValidator.message);
      return false;
    }
    _emailController.sink.add("Ok");
    if (!passwordValidator.isValid) {
      _passwordController.sink.addError(passwordValidator.message);
      return false;
    }
    _passwordController.sink.add("Ok");
    return true;
  }

  void dispose() {
    _emailController.close();
    _passwordController.close();
  }
}
