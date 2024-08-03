import 'package:firebase_auth/firebase_auth.dart';

abstract class SignUpRepository {
  /// Create an Account by Email and Password, and return a Firebase User.
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  });
}
