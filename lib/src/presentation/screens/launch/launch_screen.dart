import 'package:flutter/material.dart';

import '../../../../core/core.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              children: [
                Text(
                  AppConstants.labelCine,
                  style: AppStyles.labelCine,
                ),
                Image.asset(
                  AppImages.hanzoLogo,
                  width: 250,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
