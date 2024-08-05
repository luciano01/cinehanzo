import 'package:flutter/material.dart';

import '../../core.dart';

class AppNameWidget extends StatelessWidget {
  const AppNameWidget({
    super.key,
    this.fontSize,
    this.width,
  });

  final double? fontSize;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Text(
          AppConstants.labelCine,
          style: AppStyles.labelCine.copyWith(fontSize: fontSize),
        ),
        Image.asset(
          AppImages.hanzoLogo,
          width: width,
        ),
      ],
    );
  }
}
