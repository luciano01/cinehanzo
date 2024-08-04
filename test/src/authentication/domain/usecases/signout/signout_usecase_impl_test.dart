import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/authentication/domain/domain.dart';

class MockSignOutRepository extends Mock implements SignOutRepository {}

void main() {
  late MockSignOutRepository mockSignOutRepository;
  late SignOutUseCaseImpl signOutUsecaseImpl;

  setUp(() {
    mockSignOutRepository = MockSignOutRepository();
    signOutUsecaseImpl = SignOutUseCaseImpl(
      signOutRepository: mockSignOutRepository,
    );
  });

  test('Disconnect user from Firebase Auth.', () async {
    when(() => mockSignOutRepository.signOut()).thenAnswer((async) async => Future.value(null));

    await signOutUsecaseImpl.signOut();

    verify(() => mockSignOutRepository.signOut());
    verifyNoMoreInteractions(mockSignOutRepository);
  });

  test('Disconnect user from GoogleSignIn.', () async {
    when(() => mockSignOutRepository.disconnect()).thenAnswer((async) async => Future.value(null));

    await signOutUsecaseImpl.disconnect();

    verify(() => mockSignOutRepository.disconnect());
    verifyNoMoreInteractions(mockSignOutRepository);
  });
}
