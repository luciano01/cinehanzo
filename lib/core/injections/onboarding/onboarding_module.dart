import 'package:flutter_modular/flutter_modular.dart';

import '../../../src/presentation/presentation.dart';

class OnBoardingModule extends Module {
  @override
  void binds(i) {
    i.addInstance(OnBoardingState());
  }

  @override
  void routes(r) {
    r.child('/', child: (context) => const OnBoardingScreen());
  }
}
