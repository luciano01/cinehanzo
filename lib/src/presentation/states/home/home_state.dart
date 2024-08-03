import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
import '../../presentation.dart';

class HomeState extends ChangeNotifier {
  final AuthState _authState;

  HomeState({required AuthState authState}) : _authState = authState;

  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  String get userEmail {
    return _authState.user?.email ?? "";
  }

  String get userUid {
    return _authState.user?.uid ?? "";
  }

  Future<void> signOut() async {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 3)).then((_) async {
      try {
        await _authState.signOut();
        await _authState.disconnect();
      } on ServerException catch (_) {}
    }).whenComplete(() {
      isLoading.value = false;
      Modular.to.pushReplacementNamed("/login");
    });
    notifyListeners();
  }
}
