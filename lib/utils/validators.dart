import '../values/regex.dart';

class StackivyValidators {
  static String? emailValidator(String email) {
    if (email.isEmpty) return "Email field cannot be empty";
    if (!_validateEmail(email)) return "Please enter valid email address";
    return null;
  }

  static String? userNameValidator(String? name) {
    if (name != null && name.isEmpty) return "UserName field cannot be empty";

    if (name != null && name.length < 2) {
      return "UserName cannot be less than two characters";
    }

    return null;
  }

  static String? firstNameValidator(String? name) {
    if (name != null && name.isEmpty) return "First Name field cannot be empty";

    if (name != null && name.length < 2) {
      return "First Name cannot be less than two characters";
    }

    return null;
  }

  static String? lastNameValidator(String? name) {
    if (name != null && name.isEmpty) return "LastName field cannot be empty";

    if (name != null && name.length < 2) {
      return "Last Name cannot be less than two characters";
    }

    return null;
  }

  static String? phoneValidator(String value) {
    if (value != null && value.isEmpty) {
      return 'Phone field cannot be left empty';
    }
    if (value != null && value.length < 10) {
      return 'Phone number should have at least 11 digits';
    }
    if (!phoneRegex.hasMatch(value)) {
      return 'Please enter valid mobile number';
    }

    return null;
  }

  static bool _validateEmail(String value) {
    return (!mailRegEx.hasMatch(value)) ? false : true;
  }

  static String? passwordValidator(String? password) {
    if (password != null && password.length >= 6 && password.length <= 8) {
      return null;
    }
    if (password == null || password.isEmpty) {
      return "Password field cannot be empty";
    }
    if (password.length < 4) {
      return "Password cannot be less than six characters";
    }
    return "Password cannot be greater than eight characters";
  }
}
