import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class LoginEnterButton extends StatelessWidget {
  const LoginEnterButton({
    super.key,
    required this.onPressed,
    required this.label,
  });

  final void Function()? onPressed;

  final Widget label;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.all(
          const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
        fixedSize: MaterialStateProperty.all(
          const Size(double.maxFinite, 48),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return AppColors.pink;
            } else if (states.contains(MaterialState.disabled)) {
              return Colors.grey.shade400;
            }
            return AppColors.pink;
          },
        ),
        overlayColor: MaterialStateProperty.all<Color>(
          AppColors.black.withOpacity(0.1),
        ),
        foregroundColor: MaterialStateProperty.all<Color>(
          AppColors.white,
        ),
      ),
      onPressed: onPressed,
      child: label,
    );
  }
}
