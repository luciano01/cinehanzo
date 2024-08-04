import 'package:flutter_modular/flutter_modular.dart';

import '../../../src/authentication/presentation/presentation.dart';
import '../../core.dart';

class LaunchModule extends Module {
  @override
  void binds(i) {
    i.add<LaunchState>(
      () => LaunchState(
        authState: i.get<AuthState>(),
      ),
    );
  }

  @override
  List<Module> get imports => [AppModule()];

  @override
  void routes(r) {
    r.child('/', child: (context) => const LaunchScreen());
  }
}
