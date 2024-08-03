import 'package:firebase_auth/firebase_auth.dart';

import '../../domain.dart';

abstract class SignUpUsecase {
  /// Create an Account by Email and Password, and return a Firebase User.
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class SignUpUsecaseImpl implements SignUpUsecase {
  final SignUpRepository _signUpRepository;

  SignUpUsecaseImpl({required SignUpRepository signUpRepository})
      : _signUpRepository = signUpRepository;
  @override
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _signUpRepository.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
