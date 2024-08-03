import 'package:firebase_auth/firebase_auth.dart';

abstract class SignInRepository {
  /// Sign In by Email and return an User
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign In by GoogleSignIn and return an User.
  Future<User> googleSignIn();
}
