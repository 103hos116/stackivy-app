import 'package:flutter/material.dart';
import 'package:stackivy_assesement/style/app_style.dart';
import 'package:stackivy_assesement/style/colors.dart';

class StackivyTextFormField extends StatelessWidget {
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool obscureText;
  final String? Function(String?) validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;

  const StackivyTextFormField({
    Key? key,
    required this.controller,
    required this.textInputType,
    required this.obscureText,
    required this.validator,
    this.suffixIcon,
    this.prefixIcon,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      validator: validator,
      style: const TextStyle(
        color: kPrimaryColor,
        fontSize: 16.0,
      ),
      cursorColor: kPrimaryColor,
      keyboardType: textInputType,
      decoration: InputDecoration(
        errorMaxLines: 2,
        hintText: hintText,
        hintStyle: StackivyStyle.regular(color: kGray400, fontSize: 12.0),
        contentPadding: const EdgeInsets.all(20.0),
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        fillColor: Colors.white,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            width: 1.0,
            color: kGray400,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6.0),
          borderSide: const BorderSide(
            width: 1.0,
            color: kPrimaryColor,
          ),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
            color: kGray400,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            width: 1.0,
            color: Colors.red,
          ),
          borderRadius: BorderRadius.circular(6.0),
        ),
      ),
    );
  }
}
