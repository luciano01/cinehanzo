import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class SignOutDataSource {
  /// Disconnect user from Firebase Auth.
  Future<void> signOut();

  /// Disconnect user from GoogleSignIn.
  Future<void> disconnect();
}

class SignOutDataSourceImpl implements SignOutDataSource {
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  SignOutDataSourceImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
  })  : _firebaseAuth = firebaseAuth,
        _googleSignIn = googleSignIn;

  @override
  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  @override
  Future<void> disconnect() async {
    await _googleSignIn.disconnect();
  }
}
