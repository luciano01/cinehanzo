import 'package:cinehanzo/src/data/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSignOutDatasource extends Mock implements SignOutDataSource {}

void main() {
  late MockSignOutDatasource mockSignOutDataSource;
  late SignOutRepositoryImpl signOutRepositoryImpl;

  setUp(() {
    mockSignOutDataSource = MockSignOutDatasource();
    signOutRepositoryImpl = SignOutRepositoryImpl(
      signOutDataSource: mockSignOutDataSource,
    );
  });

  test('Should disconnect user from Firebase Auth.', () async {
    when(() => mockSignOutDataSource.signOut()).thenAnswer((_) async => Future.value(null));

    await signOutRepositoryImpl.signOut();

    verify(() => mockSignOutDataSource.signOut());
    verifyNoMoreInteractions(mockSignOutDataSource);
  });

  test('Should disconnect user from GoogleSignIn.', () async {
    when(() => mockSignOutDataSource.disconnect()).thenAnswer((_) async => Future.value(null));

    await signOutRepositoryImpl.disconnect();

    verify(() => mockSignOutDataSource.disconnect());
    verifyNoMoreInteractions(mockSignOutDataSource);
  });
}
