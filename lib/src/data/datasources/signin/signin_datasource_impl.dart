import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../core/core.dart';

abstract class SignInDataSource {
  /// Sign In by Email and return an User
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  /// Sign In by GoogleSignIn and return an User.
  Future<User> googleSignIn();
}

class SignInDataSourceImpl implements SignInDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  SignInDataSourceImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  @override
  Future<User?> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
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

  @override
  Future<User> googleSignIn() async {
    try {
      final googleUser = await _googleSignIn.signIn();

      final googleAuth = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final user = (await _firebaseAuth.signInWithCredential(credential)).user;

      return user!;
    } on FirebaseAuthException catch (error) {
      throw ServerException(message: error.message ?? "");
    }
  }
}
