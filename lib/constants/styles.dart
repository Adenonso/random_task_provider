import 'package:flutter/material.dart';
import 'package:random_task_provider/constants/colors.dart';

class TextStyles {
  static var style32 =
      bold.copyWith(color: black, fontSize: 32, fontFamily: "Lora");

  static var style28 =
      bold.copyWith(color: black, fontSize: 28, fontFamily: "Lora");

  static var style24 =
      bold.copyWith(color: black, fontSize: 24, fontFamily: "Lora");

  static var style20Lora =
      medium.copyWith(color: black, fontSize: 20, fontFamily: "Lora");

  static var style20 =
      bold.copyWith(color: black, fontSize: 20, fontFamily: "Raleway");

  static var style18Lora =
      medium.copyWith(color: black, fontSize: 18, fontFamily: "Lora");

  static var style18 =
      bold.copyWith(color: black, fontSize: 18, fontFamily: "Raleway");

  static var style16Lora =
      medium.copyWith(color: black, fontSize: 16, fontFamily: "Lora");

  static var style16 =
      medium.copyWith(color: black, fontSize: 16, fontFamily: "Raleway");

  static var style14Lora =
      medium.copyWith(color: black, fontSize: 14, fontFamily: "Lora");

  static var style14 =
      medium.copyWith(color: black, fontSize: 14, fontFamily: "Raleway");

  static var style12Lora =
      regular.copyWith(color: black, fontSize: 12, fontFamily: "Lora");

  static var style12 =
      regular.copyWith(color: black, fontSize: 12, fontFamily: "Raleway");

  static TextStyle extrabold = const TextStyle(
    fontWeight: FontWeight.w700,
  );

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
