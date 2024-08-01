import 'package:flutter_modular/flutter_modular.dart';

import '../../../src/presentation/presentation.dart';

class LaunchModule extends Module {
  @override
  void binds(i) {
    i.addInstance(LaunchState());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const LaunchScreen());
  }
}
