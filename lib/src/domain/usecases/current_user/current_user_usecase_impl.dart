import 'package:firebase_auth/firebase_auth.dart';

import '../../domain.dart';

abstract class CurrentUserUseCase {
  /// Return a Current Logged Firebase User.
  Future<User?> currentUser();
}

class CurrentUserUseCaseImpl implements CurrentUserUseCase {
  final CurrentUserRepository _currentUserRepository;

  CurrentUserUseCaseImpl({required CurrentUserRepository currentUserRepository})
      : _currentUserRepository = currentUserRepository;

  @override
  Future<User?> currentUser() async {
    return await _currentUserRepository.currentUser();
  }
}
