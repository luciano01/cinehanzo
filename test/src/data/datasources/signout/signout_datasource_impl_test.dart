import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/authentication/data/data.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockGoogleSignIn mockGoogleSignIn;
  late SignOutDataSourceImpl signOutDataSourceImpl;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockGoogleSignIn = MockGoogleSignIn();
    signOutDataSourceImpl = SignOutDataSourceImpl(
      firebaseAuth: mockFirebaseAuth,
      googleSignIn: mockGoogleSignIn,
    );
  });

  test('Should disconnect user from FirebaseAuth.', () async {
    when(() => mockFirebaseAuth.signOut()).thenAnswer((_) => Future.value(null));

    await signOutDataSourceImpl.signOut();

    verify(() => mockFirebaseAuth.signOut());
  });

  test('Should disconnect user from GoogleSignIn.', () async {
    when(() => mockGoogleSignIn.disconnect()).thenAnswer((_) => Future.value(null));

    await signOutDataSourceImpl.disconnect();

    verify(() => mockGoogleSignIn.disconnect());
  });
}
