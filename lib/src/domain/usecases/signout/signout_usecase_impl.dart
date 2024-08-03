import '../../domain.dart';

abstract class SignOutUseCase {
  /// Disconnect user from Firebase Auth.
  Future<void> signOut();

  /// Disconnect user from GoogleSignIn.
  Future<void> disconnect();
}

class SignOutUseCaseImpl implements SignOutUseCase {
  final SignOutRepository _signOutRepository;

  SignOutUseCaseImpl({required SignOutRepository signOutRepository})
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
