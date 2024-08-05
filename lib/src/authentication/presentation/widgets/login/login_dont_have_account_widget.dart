import 'package:flutter/material.dart';

import '../../../../../core/core.dart';

class LoginDontHaveAccount extends StatelessWidget {
  const LoginDontHaveAccount({
    super.key,
    required this.onPressed,
  });

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            AppConstants.labelNotHaveAccount,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: FontWeight.normal,
              fontSize: 14,
            ),
          ),
          TextButton(
            style: ButtonStyle(
              textStyle: MaterialStateProperty.all(
                const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ),
            onPressed: onPressed,
            child: const Text(
              AppConstants.labelSignUp,
            ),
          ),
        ],
      ),
    );
  }
}
