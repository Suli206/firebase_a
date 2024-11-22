import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.inputFormatters,
    this.labelText,
    this.controller,
    this.keyboardType,
    this.obscureText = false,
    this.validator,
    this.isOutline = true,
    this.onChanged,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.prefixColor,
    this.suffixColor,
    this.fillColor,
    this.isFillColor = false,
    this.textStyleSerch,
    this.errorText,
  });

  final List<TextInputFormatter>? inputFormatters;
  final String? labelText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final bool obscureText;
  final String? Function(String?)? validator;
  final bool isOutline;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final Color? prefixColor;
  final Color? suffixColor;
  final Color? fillColor;
  final bool isFillColor;
  final String? errorText;

  final TextStyle? textStyleSerch;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: textStyleSerch,
      inputFormatters: inputFormatters,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      validator: validator,
      onChanged: onChanged,
      cursorHeight: 16,
      decoration: InputDecoration(
        errorText: errorText,
       
        filled: isFillColor,
        fillColor: fillColor,
        suffixIconColor: suffixColor,
        prefixIconColor: prefixColor,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: hintStyle,
        labelText: labelText,
      ),
    );
  }
}
