import 'package:flutter/material.dart';
import 'package:random_task_provider/constants/colors.dart';

class TextStyles {
  static var style32 =
      bold.copyWith(color: black, fontSize: 32, fontFamily: "Lora");

  static var style18 =
      bold.copyWith(color: black, fontSize: 18, fontFamily: "Raleway");

  static var style16 =
      medium.copyWith(color: black, fontSize: 16, fontFamily: "Raleway");

  static var style14 =
      medium.copyWith(color: black, fontSize: 14, fontFamily: "Raleway");

  static var style12 =
      regular.copyWith(color: black, fontSize: 12, fontFamily: "Raleway");

  static TextStyle bold = const TextStyle(
    fontWeight: FontWeight.w600,
  );

  static TextStyle medium = const TextStyle(
    fontWeight: FontWeight.w500,
  );

  static TextStyle regular = const TextStyle(
    fontWeight: FontWeight.w400,
  );

  static TextStyle thin = const TextStyle(
    fontWeight: FontWeight.w300,
  );
}
