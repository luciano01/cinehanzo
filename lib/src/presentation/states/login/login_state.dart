import 'package:flutter/material.dart';

import '../../../../core/core.dart';
import '../../presentation.dart';

class LoginState extends ChangeNotifier {
  final AuthState _authState;

  LoginState({required AuthState authState}) : _authState = authState;

  bool isLoading = false;

  String? errorMessage;

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    isLoading = true;
    errorMessage = null;
    Future.delayed(const Duration(seconds: 3)).whenComplete(() async {
      try {
        await _authState.signInWithEmailAndPassword(email: email, password: password).then((user) {
          if (user != null) isLoading = false;
          // Modular.to.pushReplacementNamed('/home');
          print(user?.email);
        });
      } on ServerException catch (error) {
        errorMessage = error.message;
      } finally {
        isLoading = false;
      }
    });
    notifyListeners();
  }
}
