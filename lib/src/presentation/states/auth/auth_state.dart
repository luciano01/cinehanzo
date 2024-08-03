import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class AuthState extends ChangeNotifier {
  final CurrentUserUseCase _currentUserUseCase;
  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUsecase;

  AuthState({
    required CurrentUserUseCase currentUserUseCase,
    required SignInUseCase signInUseCase,
    required SignOutUseCase signOutUsecase,
  })  : _currentUserUseCase = currentUserUseCase,
        _signInUseCase = signInUseCase,
        _signOutUsecase = signOutUsecase {
    _currentUserUseCase.currentUser().then((setUser));
  }

  User? user;

  bool isLogged = false;

  void setUser(User? value) {
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

  /// Disconnect user from Firebase Auth.
  Future signOut() async {
    await _signOutUsecase.signOut().whenComplete(() {
      user = null;
    });
  }

  /// Disconnect user from GoogleSignIn.
  Future disconnect() async {
    await _signOutUsecase.disconnect().whenComplete(() {
      user = null;
    });
  }
}
