import 'package:firebase_auth/firebase_auth.dart';

import '../../domain.dart';

abstract class SignInUseCase {
  /// Sign In by Email and return an User
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign In by GoogleSignIn and return an User.
  Future<User> googleSignIn();
}

class SignInUseCaseImpl implements SignInUseCase {
  final SignInRepository _signInRepository;

  SignInUseCaseImpl({required SignInRepository signInRepository})
      : _signInRepository = signInRepository;

  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _signInRepository.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<User> googleSignIn() async {
    return await _signInRepository.googleSignIn();
  }
}
