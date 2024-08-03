import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../src/data/data.dart';
import '../../../src/domain/domain.dart';
import '../../../src/presentation/presentation.dart';

class AuthModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<FirebaseAuth>(() => FirebaseAuth.instance);

    i.addSingleton<GoogleSignIn>(() => GoogleSignIn());

    i.add<SignInDataSource>(
      () => SignInDataSourceImpl(
        firebaseAuth: i.get<FirebaseAuth>(),
        googleSignIn: i.get<GoogleSignIn>(),
      ),
    );

    i.add<CurrentUserDataSource>(
      () => CurrentUserDataSourceImpl(
        firebaseAuth: i.get<FirebaseAuth>(),
      ),
    );

    i.add<SignOutDataSource>(
      () => SignOutDataSourceImpl(
        firebaseAuth: i.get<FirebaseAuth>(),
        googleSignIn: i.get<GoogleSignIn>(),
      ),
    );

    i.add<SignUpDataSource>(
      () => SignUpDataSourceImpl(
        firebaseAuth: i.get<FirebaseAuth>(),
      ),
    );

    i.add<SignInRepository>(
      () => SignInRepositoryImpl(
        signInDataSource: i.get<SignInDataSource>(),
      ),
    );

    i.add<SignOutRepository>(
      () => SignOutRepositoryImpl(
        signOutDataSource: i.get<SignOutDataSource>(),
      ),
    );

    i.add<CurrentUserRepository>(
      () => CurrentUserRepositoryImpl(
        currentUserDataSource: i.get<CurrentUserDataSource>(),
      ),
    );

    i.add<SignUpRepository>(
      () => SignUpRepositoryImpl(
        signUpDataSource: i.get<SignUpDataSource>(),
      ),
    );

    i.add<SignInUseCase>(
      () => SignInUseCaseImpl(
        signInRepository: i.get<SignInRepository>(),
      ),
    );

    i.add<SignOutUseCase>(
      () => SignOutUseCaseImpl(
        signOutRepository: i.get<SignOutRepository>(),
      ),
    );

    i.add<CurrentUserUseCase>(
      () => CurrentUserUseCaseImpl(
        currentUserRepository: i.get<CurrentUserRepository>(),
      ),
    );

    i.add<SignUpUsecase>(
      () => SignUpUsecaseImpl(
        signUpRepository: i.get<SignUpRepository>(),
      ),
    );
  }

  @override
  void exportedBinds(Injector i) {
    i.add<AuthState>(
      () => AuthState(
        currentUserUseCase: i.get<CurrentUserUseCase>(),
        signInUseCase: i.get<SignInUseCase>(),
        signOutUsecase: i.get<SignOutUseCase>(),
        signUpUsecase: i.get<SignUpUsecase>(),
      ),
    );
  }
}
