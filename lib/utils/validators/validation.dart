import 'package:get/get.dart';

class UValidator {
  // Empty text
  static String? validateEmptyText(String? fieldName, String? value) {
    if (value == null || value.isEmpty) {
      return '$fieldName is required';
    }
    return null;
  }

  // Email Validator
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    if (!value.isEmail) {
      return 'Invalid email address';
    }

    return null;
  }

  // Password Validator
  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }

    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }

    if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]+$').hasMatch(value)) {
      return 'Password must include both letters and numbers';
    }

    return null;
  }

  // Phone Number Validator
  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone Number is required';
    }

    if (!value.isPhoneNumber) {
      return 'Invalid Phone Number';
    }

    return null;
  }

  // Username Validator
  static String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return 'Username is required';
    }

    if (!value.isUsername) {
      return 'Invalid username';
    }

    return null;
  }

  // First Name Validator
  static String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      return 'First Name is required';
    }

    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'First name must contain alphabetic characters only';
    }

    return null;
  }

  // Last Name Validator
  static String? validateLastName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Last Name is required';
    }

    if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
      return 'Last name must contain alphabetic characters only';
    }

    return null;
  }
}
