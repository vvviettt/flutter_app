class AuthValidator {
  static Output emailValidator(String email) {
    if (email.isEmpty) {
      return Output(false, "Please enter your email.");
    }
    RegExp regex = RegExp(
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$');
    if (regex.hasMatch(email)) {
      return Output(true, "Success");
    }
    return Output(false, "Invalid email");
  }

  static Output passwordValidator(String password) {
    if (password.isEmpty) {
      return Output(false, "Please enter your password.");
    }
    RegExp regex =
        RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (regex.hasMatch(password)) {
      return Output(true, "Success");
    }
    return Output(false,
        "Password should contain at least one uppercase, one lowercase , on digit , one special char and must be at least 8 character.");
  }
}

class Output {
  bool isValid = false;
  String message = '';
  Output(this.isValid, this.message);
}
