import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/domain.dart';
import '../../data.dart';

class SignInRepositoryImpl implements SignInRepository {
  final SignInDataSource _signInDataSource;

  SignInRepositoryImpl({required SignInDataSource signInDataSource})
      : _signInDataSource = signInDataSource;

  @override
  Future<User?> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    return await _signInDataSource.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<User> googleSignIn() async {
    return await _signInDataSource.googleSignIn();
  }
}
