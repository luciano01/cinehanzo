import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/authentication/data/data.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredential extends Mock implements UserCredential {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredential mockUserCredential;
  late SignUpDataSourceImpl signUpDataSourceImpl;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUserCredential = MockUserCredential();
    signUpDataSourceImpl = SignUpDataSourceImpl(
      firebaseAuth: mockFirebaseAuth,
    );
  });

  const mockEmail = 'user@email.com';
  const mockPassword = 'user123';

  test('Shoudl create an Account by Email and Password, and return a Firebase User.', () async {
    when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
        email: mockEmail, password: mockPassword)).thenAnswer((_) async => mockUserCredential);

    final result = await signUpDataSourceImpl.createUserWithEmailAndPassword(
      email: mockEmail,
      password: mockPassword,
    );

    expect(result, mockUserCredential.user);
    verify(() => mockFirebaseAuth.createUserWithEmailAndPassword(
          email: mockEmail,
          password: mockPassword,
        ));
    verifyNoMoreInteractions(mockFirebaseAuth);
  });
}
