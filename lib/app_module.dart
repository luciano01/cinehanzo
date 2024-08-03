import 'package:flutter_modular/flutter_modular.dart';

import 'core/core.dart';

class AppModule extends Module {
  @override
  List<Module> get imports => [
        AuthModule(),
      ];

  @override
  void routes(r) {
    r.module('/', module: LaunchModule(), transition: TransitionType.fadeIn);
    r.module('/onBoarding', module: OnBoardingModule(), transition: TransitionType.rightToLeft);
    r.module('/login', module: LoginModule(), transition: TransitionType.rightToLeft);
    r.module('/home', module: HomeModule(), transition: TransitionType.rightToLeft);
  }
}
