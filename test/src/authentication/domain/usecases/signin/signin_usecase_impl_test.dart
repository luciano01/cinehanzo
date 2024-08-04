import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/authentication/domain/domain.dart';

class MockSignInRepository extends Mock implements SignInRepository {}

class MockUser extends Mock implements User {}

void main() {
  late MockSignInRepository mockSignInRepository;
  late MockUser mockUser;
  late SignInUseCaseImpl signInUseCaseImpl;

  setUp(() {
    mockSignInRepository = MockSignInRepository();
    mockUser = MockUser();
    signInUseCaseImpl = SignInUseCaseImpl(
      signInRepository: mockSignInRepository,
    );
  });

  const mockEmail = 'user@email.com';
  const mockPassword = 'user123';

  test('Return a User after Sign In by Email and Password.', () async {
    when(() => mockSignInRepository.signInWithEmailAndPassword(
          email: mockEmail,
          password: mockPassword,
        )).thenAnswer((_) async => mockUser);

    final result = await signInUseCaseImpl.signInWithEmailAndPassword(
      email: mockEmail,
      password: mockPassword,
    );

    expect(result, mockUser);

    verify(
      () => mockSignInRepository.signInWithEmailAndPassword(
        email: mockEmail,
        password: mockPassword,
      ),
    );
  });

  test('Return a User after Sign In by GoogleSignIn.', () async {
    when(() => mockSignInRepository.googleSignIn()).thenAnswer((_) async => mockUser);

    final result = await signInUseCaseImpl.googleSignIn();

    expect(result, mockUser);

    verify(() => mockSignInRepository.googleSignIn());
  });
}
