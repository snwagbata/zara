import 'package:flutter/services.dart';

class ErrorHandler {
  static String getExceptionText(Exception e) {
    if (e is PlatformException) {
      switch (e.message) {
        case 'There is no user record corresponding to this identifier. The user may have been deleted.':
          return 'Account does not exist.';
        case 'The password is invalid or the user does not have a password.':
          return 'Password is invalid.';
        case 'A network error (such as timeout, interrupted connection or unreachable host) has occurred.':
          return 'No internet connection.';
        case 'The email address is already in use by another account.':
          return 'The email address is already in use by another account.';
        default:
          return 'Unknown error occured.';
      }
    }
    return 'Unknown error occured.';
  }
}
