import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/core.dart';
import '../../presentation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginState = Modular.get<LoginState>();

  @override
  void initState() {
    loginState.errorMessage.addListener(_listenerErrorMessage);
    loginState.isLoading.addListener(_listenerIsLoading);
    super.initState();
  }

  @override
  void dispose() {
    loginState.errorMessage.removeListener(_listenerErrorMessage);
    loginState.isLoading.removeListener(_listenerIsLoading);
    super.dispose();
  }

  void _listenerErrorMessage() {
    if (loginState.errorMessage.value.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(loginState.errorMessage.value),
          showCloseIcon: true,
          backgroundColor: Colors.red.shade300,
        ),
      );
    }
  }

  void _listenerIsLoading() {
    if (loginState.isLoading.value == true) {
      showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return const AlertDialog(
            title: Center(child: CircularProgressIndicator()),
          );
        },
      );
    } else {
      Navigator.of(context).pop();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: LoginDontHaveAccount(
        onPressed: () {
          Modular.to.pushNamed("/signup");
        },
      ),
      body: ListenableBuilder(
        listenable: loginState,
        builder: (_, __) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            children: [
              const SizedBox(
                height: 160,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppNameWidget(
                      fontSize: 14,
                      width: 120,
                    ),
                  ],
                ),
              ),
              const HeaderMessageWidget(
                title: AppConstants.labelWelcomeBack,
                subtitle: AppConstants.labelWelcomeBackMessage,
              ),
              CustomTextFormFieldWidget(
                label: const Text(AppConstants.labelEmail),
                errorText: loginState.email.isNotEmpty ? loginState.validateEmail() : null,
                onChanged: loginState.updateEmail,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: CustomTextFormFieldWidget(
                  label: const Text(AppConstants.labelPassword),
                  errorText: loginState.password.isNotEmpty ? loginState.validatePassword() : null,
                  onChanged: loginState.updatePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      loginState.updateIsShowPassword();
                    },
                    icon: Icon(
                      !loginState.isShowPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                  obscureText: !loginState.isShowPassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: CustomCheckBoxWidget(
                  value: loginState.isAgree,
                  onChanged: (value) => loginState.updateIsAgree(value!),
                  isAgree: loginState.isAgree,
                ),
              ),
              LoginEnterButton(
                onPressed: loginState.isValid()
                    ? () {
                        loginState.signInWithEmailAndPassword();
                      }
                    : null,
                label: const Text(AppConstants.labelEnter),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: LoginGoogleButton(
                  onPressed: () {
                    loginState.signWithGoogleLogin();
                  },
                  label: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(AppImages.googleG, width: 24),
                      const SizedBox(width: 10),
                      const Text(AppConstants.labelContinueGoogle),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
