import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/data/data.dart';

class MockSignInDatasource extends Mock implements SignInDataSource {}

class MockUser extends Mock implements User {}

void main() {
  late MockSignInDatasource mockSignInDataSource;
  late SignInRepositoryImpl signInRepositoryImpl;
  late MockUser mockUser;

  setUp(() {
    mockSignInDataSource = MockSignInDatasource();
    signInRepositoryImpl = SignInRepositoryImpl(
      signInDataSource: mockSignInDataSource,
    );
    mockUser = MockUser();
  });

  const mockEmail = 'user@email.com';
  const mockPassword = 'user123';

  test('Should return a User after Sign In by Email and Password from SignInDataSource', () async {
    when(() => mockSignInDataSource.signInWithEmailAndPassword(
          email: mockEmail,
          password: mockPassword,
        )).thenAnswer((_) async => mockUser);

    final user = await signInRepositoryImpl.signInWithEmailAndPassword(
      email: mockEmail,
      password: mockPassword,
    );

    expect(user, mockUser);
    verify(
      () => mockSignInDataSource.signInWithEmailAndPassword(
        email: mockEmail,
        password: mockPassword,
      ),
    );
    verifyNoMoreInteractions(mockSignInDataSource);
  });

  test('Should return a User after Sign In by GoogleSignIn from SignInDataSource.', () async {
    when(() => mockSignInDataSource.googleSignIn()).thenAnswer((_) async => mockUser);

    final user = await signInRepositoryImpl.googleSignIn();

    expect(user, mockUser);
    verify(() => mockSignInDataSource.googleSignIn());
    verifyNoMoreInteractions(mockSignInDataSource);
  });
}
