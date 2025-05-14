import 'package:random_task_provider/constants/const.dart';

class EmailValidator {
  static String? validateEmail(String value) {
    if (value.isEmpty) {
      return emptyEmailField;
    }
    // Regex for email validation
    final regExp = RegExp(emailRegex);
    if (!regExp.hasMatch(value) || value.contains(' ')) {
      return invalidEmailField;
    }

    // Check for restricted domains
    final domain = value.split('@').last.toLowerCase();
    if (domain == 'outlook.com') {
      return 'Email addresses from outlook.com are not allowed';
    }
    if (domain == 'icloud.com') {
      return 'Email addresses from icloud.com are not allowed';
    }

    return null;
  }
}

class FullNameValidator {
  static String? validateFullName(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }
    // Regex for name validation
    final regExp = RegExp(fullNameRegex);
    if (regExp.hasMatch(value) || value.contains(' ')) {
      return null;
    }
    return invalidFullName;
  }
}

class PhoneNumberValidator {
  static String? validatePhoneNumber(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }
    if (value.length < 11) {
      return PHONE_NUMBER_LENGTH_ERROR;
    }
    return null;
    // Regex for phone number validation
    // final regExp = RegExp(PHONE_NUMBER_REGEX);
    // print(regExp.hasMatch(value));
    // if (regExp.hasMatch(value)) {
    //   return null;
    // }
    // return INVALID_PHONE_NUMBER_FIELD;
  }
}

class PasswordValidator {
  static const String emptyPasswordField = "Password is required";
  static const String passwordLengthError =
      "Password cannot be less than 8 characters";
  static const String missingUppercaseError =
      "Must contain at least one capital letter";
  static const String missingLowercaseError =
      "Must contain at least one lowercase letter";
  static const String missingDigitError = "Must contain at least one number";
  static const String missingSpecialCharError =
      "Must contain at least one special character";

  static const String upperCaseRegex = r'^(?=.*[A-Z])';
  static const String lowerCaseRegex = r'^(?=.*[a-z])';
  static const String digitRegex = r'^(?=.*\d)';
  static const String specialCharRegex = r'^(?=.*[-_@$!%*#?&()])';

  static String? validatePassword(String value) {
    if (value.isEmpty) {
      return emptyPasswordField;
    }

    if (value.length < 8) {
      return passwordLengthError;
    }
    if (!RegExp(upperCaseRegex).hasMatch(value)) {
      return missingUppercaseError;
    }
    if (!RegExp(lowerCaseRegex).hasMatch(value)) {
      return missingLowercaseError;
    }
    if (!RegExp(digitRegex).hasMatch(value)) {
      return missingDigitError;
    }
    if (!RegExp(specialCharRegex).hasMatch(value)) {
      return missingSpecialCharError;
    }

    return null;
  }
}

class UsernameValidator {
  static String? validateUsername(String value) {
    if (value.isEmpty) {
      return emptyUsernameField;
    }

    if (value.length < 2) {
      return usernameLengthError;
    }

    return null;
  }
}

class FieldValidator {
  static String? validate(String value) {
    if (value.isEmpty) {
      return emptyTextField;
    }

    return null;
  }
}
