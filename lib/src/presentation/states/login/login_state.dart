import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
import '../../presentation.dart';

class LoginState extends ChangeNotifier {
  final AuthState _authState;

  LoginState({required AuthState authState}) : _authState = authState;

  String email = "";
  String password = "";
  bool isShowPassword = false;
  bool isAgree = false;
  ValueNotifier<String> errorMessage = ValueNotifier<String>("");
  ValueNotifier<bool> isLoading = ValueNotifier<bool>(false);

  void updateEmail(String value) {
    email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    password = value;
    notifyListeners();
  }

  void updateIsShowPassword() {
    isShowPassword = !isShowPassword;
    notifyListeners();
  }

  void updateIsAgree(bool value) {
    isAgree = value;
    notifyListeners();
  }

  bool isValid() {
    return validateEmail() == null && validatePassword() == null && isAgree;
  }

  String? validateEmail() {
    if (!notStartOrEndWithDot.hasMatch(email)) {
      return "Não pode começar ou terminar com um ponto.";
    } else if (!noSpaces.hasMatch(email)) {
      return "Não pode conter espaços.";
    } else if (!noSpecialChars.hasMatch(email)) {
      return "Não pode conter caracteres especiais (<, :, *, etc.).";
    } else if (!validFormat.hasMatch(email)) {
      return "Tem um formato inválido.";
    }

    return null;
  }

  String? validatePassword() {
    if (!hasLowerCase.hasMatch(password)) {
      return "Deve conter pelo menos uma letra minúscula.";
    } else if (!hasUpperCase.hasMatch(password)) {
      return "Deve conter pelo menos uma letra maiúscula.";
    } else if (!hasNumber.hasMatch(password)) {
      return "Deve conter pelo menos um número.";
    } else if (!isValidLengthAndNoSpecialChars.hasMatch(password)) {
      return "Deve conter acima de 8 caracteres e não pode conter caracteres especiais.";
    }
    return null;
  }

  Future<void> signInWithEmailAndPassword() async {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 3)).whenComplete(() async {
      try {
        await _authState.signInWithEmailAndPassword(email: email, password: password).then((user) {
          if (user != null) isLoading.value = false;
          Modular.to.pushReplacementNamed('/home');
        });
      } on ServerException catch (error) {
        errorMessage.value = error.message;
      } finally {
        errorMessage.value = "";
        isLoading.value = false;
      }
    });
    notifyListeners();
  }

  Future<void> signWithGoogleLogin() async {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 3)).whenComplete(() async {
      try {
        await _authState.signInWithgoogleSignIn().then((user) async {
          if (user != null) isLoading.value = false;
          Modular.to.pushReplacementNamed('/home');
        });
      } on ServerException catch (error) {
        errorMessage.value = error.message;
      } finally {
        errorMessage.value = "";
        isLoading.value = false;
      }
    });
  }
}
