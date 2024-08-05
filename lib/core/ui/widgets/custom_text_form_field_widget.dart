import 'package:flutter/material.dart';

import '../../core.dart';

class CustomTextFormFieldWidget extends StatelessWidget {
  const CustomTextFormFieldWidget({
    super.key,
    required this.label,
    required this.errorText,
    required this.onChanged,
    this.suffixIcon,
    this.obscureText = false,
  });

  final Widget? label;

  final String? errorText;

  final Function(String)? onChanged;

  final Widget? suffixIcon;

  final bool? obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: AppColors.black,
      style: const TextStyle(
        fontWeight: FontWeight.normal,
        color: AppColors.black,
      ),
      decoration: InputDecoration(
        label: label,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.normal,
          color: AppColors.black,
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.greyDark,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.greyDark,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AppColors.black,
            width: 2,
          ),
        ),
        suffixIcon: suffixIcon,
        errorText: errorText,
      ),
      obscureText: obscureText!,
      onChanged: onChanged,
    );
  }
}
