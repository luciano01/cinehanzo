import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/authentication/data/data.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUserCredentials extends Mock implements UserCredential {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

class MockGoogleSignInAuthentication extends Mock implements GoogleSignInAuthentication {}

class MockUser extends Mock implements User {}

class FakeAuthCredential extends Fake implements AuthCredential {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUserCredentials mockUserCredentials;
  late MockGoogleSignIn mockGoogleSignIn;
  late MockGoogleSignInAccount mockGoogleSignInAccount;
  late MockGoogleSignInAuthentication mockGoogleSignInAuthentication;
  late MockUser mockUser;
  late SignInDataSourceImpl signInDataSourceImpl;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUserCredentials = MockUserCredentials();
    mockGoogleSignIn = MockGoogleSignIn();
    mockGoogleSignInAccount = MockGoogleSignInAccount();
    mockGoogleSignInAuthentication = MockGoogleSignInAuthentication();
    mockUser = MockUser();
    signInDataSourceImpl = SignInDataSourceImpl(
      firebaseAuth: mockFirebaseAuth,
      googleSignIn: mockGoogleSignIn,
    );

    registerFallbackValue(FakeAuthCredential());
  });

  const email = 'user@email.com';
  const password = 'user123';

  test('Should return a User after Sign In by Email and Password from FirebaseAuth', () async {
    when(() => mockFirebaseAuth.signInWithEmailAndPassword(
          email: email,
          password: password,
        )).thenAnswer(
      (_) async => mockUserCredentials,
    );

    final result = await signInDataSourceImpl.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    expect(result, mockUserCredentials.user);
    verify(
      () => mockFirebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
    verifyNoMoreInteractions(mockFirebaseAuth);
  });

  test('Should return a User after Sign In by GoogleSignIn from FirebaseAuth', () async {
    when(() => mockGoogleSignIn.signIn()).thenAnswer(
      (_) async => mockGoogleSignInAccount,
    );

    when(() => mockGoogleSignInAccount.authentication).thenAnswer(
      (_) async => mockGoogleSignInAuthentication,
    );

    when(() => mockGoogleSignInAuthentication.accessToken).thenReturn(
      'mockAccessToken',
    );
    when(() => mockGoogleSignInAuthentication.idToken).thenReturn(
      'mockIdToken',
    );

    when(() => mockFirebaseAuth.signInWithCredential(any())).thenAnswer(
      (_) async => mockUserCredentials,
    );

    when(() => mockUserCredentials.user).thenReturn(
      mockUser,
    );

    final user = await signInDataSourceImpl.googleSignIn();

    expect(user, mockUser);
    verify(() => mockGoogleSignIn.signIn()).called(1);
    verify(() => mockGoogleSignInAccount.authentication).called(1);
    verify(() => mockFirebaseAuth.signInWithCredential(any())).called(1);
  });
}
