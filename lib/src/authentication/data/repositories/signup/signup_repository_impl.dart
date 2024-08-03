import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/domain.dart';
import '../../data.dart';

class SignUpRepositoryImpl implements SignUpRepository {
  final SignUpDataSource _signUpDataSource;

  SignUpRepositoryImpl({required SignUpDataSource signUpDataSource})
      : _signUpDataSource = signUpDataSource;

  @override
  Future<User?> createUserWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    return await _signUpDataSource.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }
}
