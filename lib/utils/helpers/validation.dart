import 'package:eStore/routes/index.dart';

class Validations {
  static String tag = 'validation-page';

  static String validateEmail(String value, {name: "Email is required"}) {
    String pattern = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Email address is required";
    } else if (!regExp.hasMatch(value)) {
      return "Email address is invalid";
    } else {
      return null;
    }
  }

  static String validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~.]).{8,}$';
    RegExp regExp = new RegExp(pattern);
    if (value.length == 0) {
      return "Password is Required";
    } else if (value.length < 8) {
      return "Password must be 8 atleast characters";
    } else if (!regExp.hasMatch(value)) {
      return "Check password characters";
    } else {
      return null;
    }
  }

  static String validateConfirmPassword(
      {@required String password,
      @required String confirmPassword,
      name: "New password is required"}) {
    if (confirmPassword.length == 0 || confirmPassword == "") {
      return "Confirm password is required";
    } else if (confirmPassword != password) {
      return "Password not match";
    } else {
      return null;
    }
  }

  static String validateName(String value, {name: "Name is Required"}) {
    if (value.length == 0) {
      return name;
    }
    return null;
  }

   static String validateMobile(String value) {
    String patttern = r'(^[0-9]*$)';
    RegExp regExp = new RegExp(patttern);
    if (value.length == 0) {
      return "Mobile number is Required";
    }
    if (!regExp.hasMatch(value)) {
      return "Mobile Number must be digits";
    }
    return null;
  }
}
