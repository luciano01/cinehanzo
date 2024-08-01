import 'package:flutter_modular/flutter_modular.dart';

import '../../../src/presentation/presentation.dart';

class LoginModule extends Module {
  @override
  void binds(i) {
    i.addInstance(LoginState());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LoginScreen());
  }
}
