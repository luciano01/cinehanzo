import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../domain/domain.dart';

class AuthState extends ChangeNotifier {
  final CurrentUserUseCase _currentUserUseCase;
  final SignInUseCase _signInUseCase;
  final SignOutUseCase _signOutUsecase;
  final SignUpUsecase _signUpUsecase;

  AuthState({
    required CurrentUserUseCase currentUserUseCase,
    required SignInUseCase signInUseCase,
    required SignOutUseCase signOutUsecase,
    required SignUpUsecase signUpUsecase,
  })  : _currentUserUseCase = currentUserUseCase,
        _signInUseCase = signInUseCase,
        _signOutUsecase = signOutUsecase,
        _signUpUsecase = signUpUsecase {
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

  /// Create an Account by Email and Password, and return a Firebase User.
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    user = await _signUpUsecase.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    return user;
  }
}
