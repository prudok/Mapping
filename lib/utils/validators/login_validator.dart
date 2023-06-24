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

  static String? nameValidator(String? value) {
    if (value != null && value.isNotEmpty && value.length >= 4) {
      return null;
    } else {
      return 'Enter correct name.';
    }
  }

  static String? surnameValidator(String? value) {
    if (value != null && value.isNotEmpty && value.length >= 4) {
      return null;
    } else {
      return 'Enter correct surname.';
    }
  }
}
