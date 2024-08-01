import 'package:cinehanzo/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LaunchState extends ChangeNotifier {
  LaunchState() {
    _checkIfisFirstAccess();
  }

  Future<bool> _getFirstTimeAccess() async {
    return AppSharedPreferences.getFirstTimeAccess(AppConstants.keyFirstAccess);
  }

  void _checkIfisFirstAccess() async {
    await Future.delayed(const Duration(seconds: 3)).then((_) async {
      final result = await _getFirstTimeAccess();

      if (result) {
        Modular.to.pushReplacementNamed('/login');
      } else {
        Modular.to.pushReplacementNamed('/onBoarding');
      }
    });
  }
}
