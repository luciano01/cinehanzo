import 'package:cinehanzo/src/data/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockFirebaseAuth extends Mock implements FirebaseAuth {}

class MockUser extends Mock implements User {}

void main() {
  late MockFirebaseAuth mockFirebaseAuth;
  late MockUser mockUser;
  late CurrentUserDataSourceImpl currentUserDataSourceImpl;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    mockUser = MockUser();
    currentUserDataSourceImpl = CurrentUserDataSourceImpl(
      firebaseAuth: mockFirebaseAuth,
    );
  });

  test('Should return a Current Logged Firebase User from FirebaseAuth.', () async {
    when(() => mockFirebaseAuth.currentUser).thenAnswer((_) => mockUser);

    final result = await currentUserDataSourceImpl.currentUser();

    expect(result, mockUser);
    verify(() => mockFirebaseAuth.currentUser);
    verifyNoMoreInteractions(mockFirebaseAuth);
  });
}
