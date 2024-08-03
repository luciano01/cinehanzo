import 'package:firebase_auth/firebase_auth.dart';

abstract class CurrentUserRepository {
  /// Return a Current Logged Firebase User.
  Future<User?> currentUser();
}
