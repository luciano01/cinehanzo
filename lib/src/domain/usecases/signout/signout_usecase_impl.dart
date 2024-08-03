import '../../domain.dart';

abstract class SignOutUsecase {
  /// Disconnect user from Firebase Auth.
  Future<void> signOut();

  /// Disconnect user from GoogleSignIn.
  Future<void> disconnect();
}

class SignOutUsecaseImpl implements SignOutUsecase {
  final SignOutRepository _signOutRepository;

  SignOutUsecaseImpl({required SignOutRepository signOutRepository})
      : _signOutRepository = signOutRepository;

  @override
  Future<void> signOut() async {
    await _signOutRepository.signOut();
  }

  @override
  Future<void> disconnect() async {
    await _signOutRepository.disconnect();
  }
}
