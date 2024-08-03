import 'package:firebase_auth/firebase_auth.dart';

import '../../../domain/domain.dart';
import '../../data.dart';

class CurrentUserRepositoryImpl implements CurrentUserRepository {
  final CurrentUserDataSource _currentUserDatasource;

  CurrentUserRepositoryImpl(
      {required CurrentUserDataSource currentUserDataSource})
      : _currentUserDatasource = currentUserDataSource;

  @override
  Future<User?> currentUser() async {
    return await _currentUserDatasource.currentUser();
  }
}
