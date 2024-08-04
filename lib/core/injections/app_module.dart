import 'package:flutter_modular/flutter_modular.dart';

import '../core.dart';

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
    r.module('/signup', module: SignUpModule(), transition: TransitionType.rightToLeft);
    r.module('/movieDetails', module: MovieDetailsModule(), transition: TransitionType.rightToLeft);
  }
}
