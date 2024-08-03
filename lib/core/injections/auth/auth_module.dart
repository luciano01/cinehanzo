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

    i.add<SignInRepository>(
      () => SignInRepositoryImpl(
        signInDataSource: i.get<SignInDataSource>(),
      ),
    );

    i.add<SignInUseCase>(
      () => SignInUseCaseImpl(
        signInRepository: i.get<SignInRepository>(),
      ),
    );
  }

  @override
  void exportedBinds(Injector i) {
    i.add<AuthState>(
      () => AuthState(
        signInUseCase: i.get<SignInUseCase>(),
      ),
    );
  }
}
