import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/core.dart';
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
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                        top: 16,
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: AppColors.greyLight,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: IconButton(
                          onPressed: () {
                            Modular.to.pop();
                          },
                          icon: const Icon(Icons.arrow_back),
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 160,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                Text(
                                  AppConstants.labelCine,
                                  style: AppStyles.labelCine.copyWith(fontSize: 14),
                                ),
                                Image.asset(
                                  AppImages.hanzoLogo,
                                  width: 120,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      textAlign: TextAlign.left,
                      AppConstants.labelCreateYourAccount,
                      style: TextStyle(
                        color: AppColors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 46,
                      ),
                      child: Text(
                        textAlign: TextAlign.left,
                        AppConstants.labelCreateYourAccountMessage,
                        style: TextStyle(
                          color: AppColors.greyDark,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ],
                ),
                TextFormField(
                  cursorColor: AppColors.black,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppColors.black,
                  ),
                  decoration: InputDecoration(
                    label: const Text(AppConstants.labelEmail),
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.black,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.greyDark,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.greyDark,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.black,
                        width: 2,
                      ),
                    ),
                    errorText: signUpState.email.isNotEmpty ? signUpState.validateEmail() : null,
                  ),
                  onChanged: signUpState.updateEmail,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: TextFormField(
                    cursorColor: AppColors.black,
                    style: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.black,
                    ),
                    decoration: InputDecoration(
                      label: const Text(AppConstants.labelPassword),
                      labelStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        color: AppColors.black,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                        vertical: 20,
                        horizontal: 10,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.greyDark,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.greyDark,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                          color: AppColors.black,
                          width: 2,
                        ),
                      ),
                      errorText:
                          signUpState.password.isNotEmpty ? signUpState.validatePassword() : null,
                    ),
                    onChanged: signUpState.updatePassword,
                  ),
                ),
                TextFormField(
                  cursorColor: AppColors.black,
                  style: const TextStyle(
                    fontWeight: FontWeight.normal,
                    color: AppColors.black,
                  ),
                  decoration: InputDecoration(
                    label: const Text(AppConstants.labelRepeatPassword),
                    labelStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      color: AppColors.black,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 20,
                      horizontal: 10,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.greyDark,
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.greyDark,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(
                        color: AppColors.black,
                        width: 2,
                      ),
                    ),
                    errorText: signUpState.repeatPassword.isNotEmpty
                        ? signUpState.validateRepeatPassword()
                        : null,
                  ),
                  onChanged: signUpState.updateRepeatPassword,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: signUpState.isAgree,
                        activeColor: AppColors.pink,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                        onChanged: (value) => signUpState.updateIsAgree(value!),
                      ),
                      Expanded(
                        child: Text(
                          textAlign: TextAlign.left,
                          AppConstants.labelReadAndAgree,
                          style: TextStyle(
                            color: AppColors.black,
                            fontWeight: signUpState.isAgree ? FontWeight.bold : FontWeight.normal,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        color: AppColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                    fixedSize: MaterialStateProperty.all(
                      const Size(double.maxFinite, 48),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    backgroundColor: MaterialStateProperty.resolveWith<Color>(
                      (Set<MaterialState> states) {
                        if (states.contains(MaterialState.pressed)) {
                          return AppColors.pink;
                        } else if (states.contains(MaterialState.disabled)) {
                          return Colors.grey.shade400;
                        }
                        return AppColors.pink;
                      },
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                      AppColors.black.withOpacity(0.1),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      AppColors.white,
                    ),
                  ),
                  onPressed: signUpState.isValid()
                      ? () {
                          signUpState.createUserWithEmailAndPassword();
                        }
                      : null,
                  child: const Text(AppConstants.labelCreateAccount),
                ),
              ],
            );
          },
        ));
  }
}
