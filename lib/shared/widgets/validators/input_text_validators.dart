class Validators {
  String? validateName(String value) {
    String pattern = r'^[a-z A-Z,.\-]+$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'The name parameter is mandatory*';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid name*';
    }
    return null;
  }

  String? validateEmail(String value) {
    String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$';
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      return 'The email parameetr is mandatory*';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter a valid email*';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) return "The password parameter is mandatory*";
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value))
        return "should contain at least one upper case character*";
      if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value))
        return "should contain at least one lower case character*";
      if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value))
        return "should contain at least number*";
      if (!RegExp(r'^(?=.*?[!@#\$&*~]).{8,}').hasMatch(value))
        return "should contain at least one special character or 8 characters*";
    }
    return null;
  }

  String? validateConfirmPassword(String value, String value1) {
    if (value.isEmpty) {
      return "The password parameter is mandatory*";
    } else if (value != value1) {
      return 'Password do not macth*';
    }
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    if (!regExp.hasMatch(value)) {
      if (!RegExp(r'^(?=.*?[A-Z])').hasMatch(value))
        return "should contain at least one upper case character*";
      if (!RegExp(r'^(?=.*?[a-z])').hasMatch(value))
        return "should contain at least one lower case character*";
      if (!RegExp(r'^(?=.*?[0-9])').hasMatch(value))
        return "should contain at least number*";
      if (!RegExp(r'^(?=.*?[!@#\$&*~]).{8,}').hasMatch(value))
        return "should contain at least one special character or 8 characters*";
    }
    return null;
  }
}
