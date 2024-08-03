import '../../../domain/domain.dart';
import '../../data.dart';

class SignOutRepositoryImpl implements SignOutRepository {
  final SignOutDataSource _signOutDataSource;

  SignOutRepositoryImpl({required SignOutDataSource signOutDataSource})
      : _signOutDataSource = signOutDataSource;
  @override
  Future<void> signOut() async {
    await _signOutDataSource.signOut();
  }

  @override
  Future<void> disconnect() async {
    await _signOutDataSource.disconnect();
  }
}
