class LoginValidator {
  static String? emailValidator(String? value) {
    if (value != null && value.isNotEmpty && value.contains('@')) {
      return null;
    } else {
      return 'Enter correct email.';
    }
  }

  static String? passwordValidator(String? value) {
    if (value != null && value.isNotEmpty && value.length >= 6) {
      return null;
    } else {
      return 'Enter correct password.';
    }
  }
}
