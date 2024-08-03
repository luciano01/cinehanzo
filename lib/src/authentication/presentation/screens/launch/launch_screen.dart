import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/core.dart';
import '../../presentation.dart';

class LaunchScreen extends StatelessWidget {
  const LaunchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Modular.get<LaunchState>();

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
