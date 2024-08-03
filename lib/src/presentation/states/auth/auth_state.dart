import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class AuthState extends ChangeNotifier {
  // final CurrentUserUseCase _currentUserUseCase;
  final SignInUseCase _signInUseCase;

  AuthState({
    // required CurrentUserUseCase currentUserUseCase,
    required SignInUseCase signInUseCase,
  }) : //_currentUserUseCase = currentUserUseCase,
        _signInUseCase = signInUseCase {
    // _currentUserUseCase.currentUser().then((setUser));
  }

  User? user;

  bool isLogged = false;

  setUser(User? value) {
    user = value;
    isLogged = value != null;
    notifyListeners();
  }

  /// Return a User after Sign In by Email and Password.
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    user = await _signInUseCase.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    notifyListeners();
    return user;
  }

  /// Return a User after Sign In by GoogleSignIn.
  Future<User?> signInWithgoogleSignIn() async {
    user = await _signInUseCase.googleSignIn();
    notifyListeners();
    return user;
  }
}
