import 'package:firebase_auth/firebase_auth.dart';

abstract class CurrentUserDataSource {
  /// Return a Current Logged Firebase User.
  Future<User?> currentUser();
}

class CurrentUserDataSourceImpl implements CurrentUserDataSource {
  final FirebaseAuth _firebaseAuth;

  CurrentUserDataSourceImpl({required FirebaseAuth firebaseAuth})
      : _firebaseAuth = firebaseAuth;

  @override
  Future<User?> currentUser() async {
    return _firebaseAuth.currentUser;
  }
}
