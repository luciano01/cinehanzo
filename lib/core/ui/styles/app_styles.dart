import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../core.dart';

class AppStyles {
  static TextStyle labelCine = GoogleFonts.titanOne(
    textStyle: const TextStyle(
      color: AppColors.black,
      fontSize: 28,
    ),
  );

  static TextStyle splashTitle = const TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.bold,
    fontSize: 22,
  );

  static TextStyle splashSubtitle = const TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  static TextStyle labelButton = const TextStyle(
    color: AppColors.white,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );

  static TextStyle textTextFormField = const TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.normal,
    fontSize: 16,
  );
}
