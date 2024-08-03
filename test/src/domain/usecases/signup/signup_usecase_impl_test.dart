import 'package:cinehanzo/src/domain/domain.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockSignUpRepository extends Mock implements SignUpRepository {}

class MockUser extends Mock implements User {}

void main() {
  late MockSignUpRepository mockSignUpRepository;
  late MockUser mockUser;
  late SignUpUsecaseImpl signUpUsecaseImpl;

  setUp(() {
    mockSignUpRepository = MockSignUpRepository();
    mockUser = MockUser();
    signUpUsecaseImpl = SignUpUsecaseImpl(
      signUpRepository: mockSignUpRepository,
    );
  });

  const mockEmail = 'user@email.com';
  const mockPassword = 'user123';

  test('Create an Account by Email and Password, and return a Firebase User.', () async {
    when(() => mockSignUpRepository.createUserWithEmailAndPassword(
        email: mockEmail, password: mockPassword)).thenAnswer((_) async => mockUser);

    final result = await signUpUsecaseImpl.createUserWithEmailAndPassword(
      email: mockEmail,
      password: mockPassword,
    );

    expect(result, mockUser);
    verify(() => mockSignUpRepository.createUserWithEmailAndPassword(
        email: mockEmail, password: mockPassword));
  });
}
