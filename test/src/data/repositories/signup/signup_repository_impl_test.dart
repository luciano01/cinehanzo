import 'package:cinehanzo/src/data/data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockCreateUserDatasource extends Mock implements SignUpDataSource {}

class MockUser extends Mock implements User {}

void main() {
  late MockCreateUserDatasource mockCreateUserDataSource;
  late SignUpRepositoryImpl createUserRepositoryImpl;
  late MockUser mockUser;

  setUp(() {
    mockCreateUserDataSource = MockCreateUserDatasource();
    createUserRepositoryImpl = SignUpRepositoryImpl(
      signUpDataSource: mockCreateUserDataSource,
    );
    mockUser = MockUser();
  });

  const mockEmail = 'user@email.com';
  const mockPassword = 'user123';

  test('Should create an Account by Email and Password, and return a Firebase User.', () async {
    when(() => mockCreateUserDataSource.createUserWithEmailAndPassword(
        email: mockEmail, password: mockPassword)).thenAnswer((_) async => mockUser);

    final user = await createUserRepositoryImpl.createUserWithEmailAndPassword(
      email: mockEmail,
      password: mockPassword,
    );

    expect(user, mockUser);
    verify(() => mockCreateUserDataSource.createUserWithEmailAndPassword(
        email: mockEmail, password: mockPassword));
  });
}
