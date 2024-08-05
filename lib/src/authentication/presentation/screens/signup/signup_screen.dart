import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../core/core.dart';
import '../../presentation.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final signUpState = Modular.get<SignUpState>();

  @override
  void initState() {
    signUpState.errorMessage.addListener(_listenerErrorMessage);
    signUpState.isLoading.addListener(_listenerIsLoading);
    super.initState();
  }

  @override
  void dispose() {
    signUpState.errorMessage.removeListener(_listenerErrorMessage);
    signUpState.isLoading.removeListener(_listenerIsLoading);
    super.dispose();
  }

  void _listenerErrorMessage() {
    if (signUpState.errorMessage.value.isNotEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(signUpState.errorMessage.value),
          showCloseIcon: true,
          backgroundColor: Colors.red.shade300,
        ),
      );
    }
  }

  void _listenerIsLoading() {
    if (signUpState.isLoading.value == true) {
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
      body: ListenableBuilder(
        listenable: signUpState,
        builder: (_, __) {
          return ListView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 16,
            ),
            children: [
              const SignUpBackButton(),
              const HeaderMessageWidget(
                title: AppConstants.labelCreateYourAccount,
                subtitle: AppConstants.labelCreateYourAccountMessage,
              ),
              CustomTextFormFieldWidget(
                label: const Text(AppConstants.labelEmail),
                errorText: signUpState.email.isNotEmpty ? signUpState.validateEmail() : null,
                onChanged: signUpState.updateEmail,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: CustomTextFormFieldWidget(
                  label: const Text(AppConstants.labelPassword),
                  errorText:
                      signUpState.password.isNotEmpty ? signUpState.validatePassword() : null,
                  obscureText: !signUpState.isShowPassword,
                  onChanged: signUpState.updatePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      signUpState.updateIsShowPassword();
                    },
                    icon: Icon(
                      !signUpState.isShowPassword
                          ? Icons.visibility_off_outlined
                          : Icons.visibility_outlined,
                    ),
                  ),
                ),
              ),
              CustomTextFormFieldWidget(
                label: const Text(AppConstants.labelRepeatPassword),
                errorText:
                    signUpState.password.isNotEmpty ? signUpState.validateRepeatPassword() : null,
                obscureText: !signUpState.isShowPassword,
                onChanged: signUpState.updateRepeatPassword,
                suffixIcon: IconButton(
                  onPressed: () {
                    signUpState.updateIsShowPassword();
                  },
                  icon: Icon(
                    !signUpState.isShowPassword
                        ? Icons.visibility_off_outlined
                        : Icons.visibility_outlined,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: CustomCheckBoxWidget(
                  value: signUpState.isAgree,
                  onChanged: (value) => signUpState.updateIsAgree(value!),
                ),
              ),
              LoginEnterButton(
                onPressed: signUpState.isValid()
                    ? () {
                        signUpState.createUserWithEmailAndPassword();
                      }
                    : null,
                label: const Text(AppConstants.labelCreateAccount),
              ),
            ],
          );
        },
      ),
    );
  }
}
