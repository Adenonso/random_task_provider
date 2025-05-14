// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

double width(context) => MediaQuery.of(context).size.width;
double height(context) => MediaQuery.of(context).size.height;

const double BODY_PADDING = 16.0;
verticalSpaceTiny() => const SizedBox(height: 5);
verticalSpaceSmall() => const SizedBox(height: 10);
verticalSpaceMedium() => const SizedBox(height: 25);
verticalSpaceLarge() => const SizedBox(height: 50);
verticalSpaceMassive() => const SizedBox(height: 100);

horizontalSpaceTiny() => const SizedBox(width: 5);
horizontalSpaceSmall() => const SizedBox(width: 10);
horizontalSpaceMedium() => const SizedBox(width: 25);
horizontalSpaceLarge() => const SizedBox(width: 50);

verticalSpace(double factor, context) => SizedBox(height: height(context) * factor);
horizontalSpace(double factor, context) => SizedBox(width: width(context) * factor);

const String emptyEmailField = 'Email field cannot be empty!';
const String emptyTextField = 'Field cannot be empty!';
const String emptyPasswordField = 'Password field cannot be empty';
const String invalidEmailField = "Email address is not valid";
const String invalidFullName = "Name provided isn't valid. Add another name";
const String passwordLengthError = 'Password length must be greater than 8';
const String invalidPassword = 'Password must meet all requirements';
const String emptyUsernameField = 'Name cannot be empty';
const String usernameLengthError = 'Name length must be greater than 2';
const String emailRegex =
    '[a-zA-Z0-9+._%-+]{1,256}\\@[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}(\\.[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25})+';
const String fullNameRegex = r'^[a-z A-Z,.\-]+$';
const String passwordRegex =
    r"^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[-_@$!%*#?&()])[A-Za-z\d\-_@$!%^*.,~`#?&()]{8,}$";
const String upperCaseRegex = r'^(?=.*?[A-Z])(?=.*?[a-z]).{8,}$';
const String lowerCaseRegex = r'^(?=.*?[a-z]).{8,}$';
const String symbolRegex = r'^(?=.*?[!@#\$&*~]).{8,}$';
const String digitRegex = r'^(?=.*?[0-9]).{8,}$';

const String PHONE_NUMBER_REGEX = r'0[789][01]\d{8}';
const String PHONE_NUMBER_LENGTH_ERROR = 'Phone number must be 11 digits';
const String INVALID_PHONE_NUMBER_FIELD =
    "Number provided isn't valid.Try another phone number";

