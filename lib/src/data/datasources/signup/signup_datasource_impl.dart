import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/core.dart';

abstract class SignUpDataSource {
  /// Create an Account by Email and Password, and return a Firebase User.
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}

class SignUpDataSourceImpl implements SignUpDataSource {
  final FirebaseAuth _firebaseAuth;

  SignUpDataSourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        return userCredential.user;
      } else {
        return null;
      }
    } on FirebaseAuthException catch (error) {
      throw ServerException(message: error.message ?? "");
    }
  }
}
