import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';

class OnBoardingState {
  Future<void> _setFirstTimeAccess() async {
    await AppSharedPreferences.setFirstTimeAccess(AppConstants.keyFirstAccess, true);
  }

  void goToLogin() async {
    await _setFirstTimeAccess().then((_) {
      Modular.to.pushReplacementNamed('/login');
    });
  }
}
