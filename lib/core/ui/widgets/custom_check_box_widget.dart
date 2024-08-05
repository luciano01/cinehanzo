import 'package:flutter/material.dart';

import '../../core.dart';

class CustomCheckBoxWidget extends StatelessWidget {
  const CustomCheckBoxWidget({
    super.key,
    required this.value,
    required this.onChanged,
    this.isAgree = false,
  });

  final bool? value;

  final Function(bool?)? onChanged;

  final bool? isAgree;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          activeColor: AppColors.pink,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(4),
          ),
          onChanged: onChanged,
        ),
        Expanded(
          child: Text(
            textAlign: TextAlign.left,
            AppConstants.labelReadAndAgree,
            style: TextStyle(
              color: AppColors.black,
              fontWeight: isAgree! ? FontWeight.bold : FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
