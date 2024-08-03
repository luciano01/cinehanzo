import 'package:flutter_modular/flutter_modular.dart';

import '../../../src/authentication/presentation/presentation.dart';
import '../../core.dart';

class SignUpModule extends Module {
  @override
  void binds(i) {
    i.add<SignUpState>(
      () => SignUpState(
        authState: i.get<AuthState>(),
      ),
    );
  }

  @override
  List<Module> get imports => [AuthModule()];

  @override
  void routes(r) {
    r.child('/', child: (context) => const SignUpScreen());
  }
}
