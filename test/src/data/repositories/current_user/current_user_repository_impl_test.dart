import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:cinehanzo/src/authentication/data/data.dart';

class MockCurrentUserDatasource extends Mock implements CurrentUserDataSource {}

class MockUser extends Mock implements User {}

void main() {
  late MockCurrentUserDatasource mockCurrentUserDataSource;
  late CurrentUserRepositoryImpl currentUserRepositoryImpl;
  late MockUser mockUser;

  setUp(() {
    mockCurrentUserDataSource = MockCurrentUserDatasource();
    currentUserRepositoryImpl = CurrentUserRepositoryImpl(
      currentUserDataSource: mockCurrentUserDataSource,
    );
    mockUser = MockUser();
  });

  test('Should return a Current Logged Firebase User.', () async {
    when(() => mockCurrentUserDataSource.currentUser()).thenAnswer((_) async => mockUser);

    final user = await currentUserRepositoryImpl.currentUser();

    expect(user, mockUser);
    verify(() => mockCurrentUserDataSource.currentUser());
    verifyNoMoreInteractions(mockCurrentUserDataSource);
  });
}
