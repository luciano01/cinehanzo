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
    await Future.delayed(const Duration(seconds: 1)).then((_) async {
      final result = await _getFirstTimeAccess();

      if (result) {
        Modular.to.pushReplacementNamed('/login');
      } else {
        Modular.to.pushReplacementNamed('/onBoarding');
      }
    });
  }
}
