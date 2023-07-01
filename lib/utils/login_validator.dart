import 'package:flutter/cupertino.dart';

import '../generated/l10n.dart';

class FormValidator {
  static String? emailValidator(BuildContext context, String? value) {
    if (value != null && value.isNotEmpty && value.contains('@')) {
      return null;
    } else {
      return S.of(context).enterCorrectEmail;
    }
  }

  static String? passwordValidator(BuildContext context, String? value) {
    if (value != null && value.isNotEmpty && value.length >= 6) {
      return null;
    } else {
      return S.of(context).enterCorrectPassword;
    }
  }

  static String? nameValidator(BuildContext context, String? value) {
    if (value != null && value.isNotEmpty && value.length >= 4) {
      return null;
    } else {
      return S.of(context).enterCorrectName;
    }
  }

  static String? surnameValidator(BuildContext context, String? value) {
    if (value != null && value.isNotEmpty && value.length >= 4) {
      return null;
    } else {
      return S.of(context).enterCorrectSurname;
    }
  }
}
