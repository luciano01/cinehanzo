import 'package:flutter_modular/flutter_modular.dart';

import '../../../app_module.dart';
import '../../../src/authentication/presentation/presentation.dart';

class HomeModule extends Module {
  @override
  void binds(i) {
    i.add<HomeState>(
      () => HomeState(
        authState: i.get<AuthState>(),
      ),
    );
  }

  @override
  List<Module> get imports => [AppModule()];

  @override
  void routes(r) {
    r.child('/', child: (context) => const HomeScreen());
  }
}
