import 'package:flutter_modular/flutter_modular.dart';

import '../core.dart';

class AppModule extends Module {
  @override
  void binds(i) {}

  @override
  void routes(r) {
    r.module('/', module: LaunchModule());
    r.module('/onBoarding', module: OnBoardingModule());
    r.module('/login', module: LoginModule());
  }
}
