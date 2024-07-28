class Validator {
  static String? emailValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      String val = value.trim();
      RegExp exp = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
      if (val.isEmpty) {
        return 'Please enter email';
      } else if (!exp.hasMatch(val)) {
        return 'Invalid email';
      }
    } else {
      return 'Please enter email';
    }

    return null;
  }

  static String? passwordValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      String val = value.trim();
      RegExp exp = RegExp(
          r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
      if (val.isEmpty) {
        return 'Please enter password';
      } else if (!exp.hasMatch(val)) {
        return 'Enter valid password';
      }
    } else {
      return 'Please enter password';
    }

    return null;
  }
}
