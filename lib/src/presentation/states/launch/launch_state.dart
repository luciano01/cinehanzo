import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
import '../../presentation.dart';

class LaunchState {
  final AuthState _authState;

  LaunchState({required AuthState authState}) : _authState = authState {
    _checkIfisFirstAccess();
  }

  Future<bool> _getFirstTimeAccess() async {
    return AppSharedPreferences.getFirstTimeAccess(AppConstants.keyFirstAccess);
  }

  void _checkIfisFirstAccess() async {
    await Future.delayed(const Duration(seconds: 2)).then((_) async {
      final result = await _getFirstTimeAccess();

      if (result) {
        checkIfUserIsLogged();
      } else {
        Modular.to.pushReplacementNamed('/onBoarding');
      }
    });
  }

  void checkIfUserIsLogged() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      if (_authState.isLogged) {
        Modular.to.pushReplacementNamed('/home');
      } else {
        Modular.to.pushReplacementNamed('/login');
      }
    });
  }
}
