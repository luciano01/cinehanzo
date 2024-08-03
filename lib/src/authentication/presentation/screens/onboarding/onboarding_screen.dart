import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../../../../../core/core.dart';
import '../../presentation.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final launchState = Modular.get<OnBoardingState>();
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: IntroductionScreen(
        pages: [
          PageViewModel(
            titleWidget: SizedBox(
              height: 400,
              child: SvgPicture.asset(
                AppImages.imageSplashOne,
                width: 280,
              ),
            ),
            bodyWidget: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppConstants.labelSplashOneTitlePartOne.toUpperCase(),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: AppColors.hanzo,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: AppConstants.labelSplashOneTitlePartTwo.toUpperCase(),
                        style: AppStyles.splashTitle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    textAlign: TextAlign.center,
                    AppConstants.labelSplashSubtitlePartOne,
                    style: AppStyles.splashSubtitle,
                  ),
                ),
              ],
            ),
          ),
          PageViewModel(
            titleWidget: SizedBox(
              height: 400,
              child: SvgPicture.asset(
                AppImages.imageSplashTwo,
                width: 280,
              ),
            ),
            bodyWidget: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppConstants.labelSplashTwoTitlePartOne.toUpperCase(),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: AppColors.hanzo,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: AppConstants.labelSplashTwoTitlePartTwo.toUpperCase(),
                        style: AppStyles.splashTitle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    textAlign: TextAlign.center,
                    AppConstants.labelSplashSubtitlePartTwo,
                    style: AppStyles.splashSubtitle,
                  ),
                ),
              ],
            ),
          ),
          PageViewModel(
            titleWidget: SizedBox(
              height: 400,
              child: SvgPicture.asset(
                AppImages.imageSplashThree,
                width: 280,
              ),
            ),
            bodyWidget: Column(
              children: [
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    text: AppConstants.labelSplashThreeTitlePartOne.toUpperCase(),
                    style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                        color: AppColors.hanzo,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    children: [
                      TextSpan(
                        text: AppConstants.labelSplashThreeTitlePartTwo.toUpperCase(),
                        style: AppStyles.splashTitle,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Text(
                    textAlign: TextAlign.center,
                    AppConstants.labelSplashSubtitlePartThree,
                    style: AppStyles.splashSubtitle,
                  ),
                ),
              ],
            ),
          ),
        ],
        bodyPadding: const EdgeInsets.all(16),
        animationDuration: 700,
        dotsDecorator: DotsDecorator(
          color: Colors.grey.shade300,
          activeColor: AppColors.hanzo.withOpacity(0.6),
        ),
        back: const Icon(
          Icons.arrow_back,
          color: AppColors.hanzo,
        ),
        skip: const Text(
          'Pular',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.hanzo,
          ),
        ),
        next: const Icon(
          Icons.arrow_forward,
          color: AppColors.hanzo,
        ),
        done: const Text(
          'Feito',
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: AppColors.hanzo,
          ),
        ),
        skipStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppColors.hanzo.withOpacity(0.1),
          ),
        ),
        doneStyle: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(
            AppColors.hanzo.withOpacity(0.1),
          ),
        ),
        autoScrollDuration: 3000,
        showBackButton: true,
        initialPage: 0,
        onDone: () {
          launchState.goToLogin();
        },
        onSkip: () {},
      ),
    );
  }
}
