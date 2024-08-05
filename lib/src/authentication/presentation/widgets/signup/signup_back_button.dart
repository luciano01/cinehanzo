import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/core.dart';

class SignUpBackButton extends StatelessWidget {
  const SignUpBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 36,
          ),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.greyLight,
              borderRadius: BorderRadius.circular(8),
            ),
            child: IconButton(
              onPressed: () {
                Modular.to.pop();
              },
              icon: const Icon(Icons.arrow_back),
            ),
          ),
        ),
        const Center(
          child: SizedBox(
            height: 160,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AppNameWidget(
                  fontSize: 14,
                  width: 120,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
