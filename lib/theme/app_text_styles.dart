import 'package:flutter/material.dart';

abstract class AppTextStyles {
  static TextStyle s14W400({Color? color}) => TextStyle(
        color: color ?? Colors.white,
        fontSize: 14,
        height: 0.8,
        fontWeight: FontWeight.w400,
      );
  static TextStyle s18W500({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: 18,
        height: 0.8,
        fontWeight: FontWeight.w500,
      );

  static TextStyle s22W400({Color? color}) => TextStyle(
        color: color ?? Colors.white,
        fontSize: 22,
        fontWeight: FontWeight.w500,
      );
  static TextStyle s24W400({Color? color}) => TextStyle(
        color: color ?? Colors.black,
        fontSize: 24,
        fontWeight: FontWeight.w500,
      );
}
