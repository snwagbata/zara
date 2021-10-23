class Validator {
  static String? email(String? value) {
    String pattern =
        r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Please enter a valid email address.';
    } else {
      return null;
    }
  }

  static String? password(String? value) {
    String pattern = r'^.{8,}$';
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Password must be at least 8 characters.';
    } else {
      return null;
    }
  }

  static String? name(String? value) {
    String pattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    RegExp regex = RegExp(pattern);
    if (!regex.hasMatch(value!)) {
      return 'Please enter your name.';
    } else {
      return null;
    }
  }
}
