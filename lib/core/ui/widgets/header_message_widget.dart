import 'package:flutter/material.dart';

import '../../core.dart';

class HeaderMessageWidget extends StatelessWidget {
  const HeaderMessageWidget({
    super.key,
    required this.title,
    required this.subtitle,
  });

  final String title;

  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textAlign: TextAlign.left,
          title,
          style: const TextStyle(
            color: AppColors.black,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            bottom: 46,
          ),
          child: Text(
            textAlign: TextAlign.left,
            subtitle,
            style: const TextStyle(
              color: AppColors.greyDark,
              fontWeight: FontWeight.normal,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }
}
