abstract class SignOutRepository {
  /// Disconnect user from Firebase Auth.
  Future<void> signOut();

  /// Disconnect user from GoogleSignIn.
  Future<void> disconnect();
}
