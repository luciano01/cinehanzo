import 'package:cinehanzo/core/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/core.dart';
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
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              AppConstants.labelNotHaveAccount,
              style: TextStyle(
                color: AppColors.black,
                fontWeight: FontWeight.normal,
                fontSize: 14,
              ),
            ),
            TextButton(
              style: ButtonStyle(
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
                  ),
                ),
              ),
              onPressed: () {},
              child: const Text(
                AppConstants.labelSignUp,
              ),
            ),
          ],
        ),
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
              SizedBox(
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
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    textAlign: TextAlign.left,
                    AppConstants.labelWelcomeBack,
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
                      AppConstants.labelWelcomeBackMessage,
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
                  errorText: loginState.email.isNotEmpty ? loginState.validateEmail() : null,
                ),
                onChanged: loginState.updateEmail,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
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
                    suffixIcon: IconButton(
                        onPressed: () {
                          loginState.updateIsShowPassword();
                        },
                        icon: Icon(
                          !loginState.isShowPassword
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        )),
                    errorText:
                        loginState.password.isNotEmpty ? loginState.validatePassword() : null,
                  ),
                  obscureText: !loginState.isShowPassword,
                  onChanged: loginState.updatePassword,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  bottom: 16,
                ),
                child: Row(
                  children: [
                    Checkbox(
                      value: loginState.isAgree,
                      activeColor: AppColors.pink,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                      onChanged: (value) => loginState.updateIsAgree(value!),
                    ),
                    Expanded(
                      child: Text(
                        textAlign: TextAlign.left,
                        AppConstants.labelReadAndAgree,
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: loginState.isAgree ? FontWeight.bold : FontWeight.normal,
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
                onPressed: loginState.isValid()
                    ? () {
                        loginState.signInWithEmailAndPassword();
                      }
                    : null,
                child: const Text(AppConstants.labelEnter),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: TextButton(
                  style: ButtonStyle(
                    textStyle: MaterialStateProperty.all(
                      const TextStyle(
                        color: AppColors.black,
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
                          return AppColors.greyLight;
                        } else if (states.contains(MaterialState.disabled)) {
                          return Colors.grey.shade400;
                        }
                        return AppColors.greyLight;
                      },
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                      AppColors.black.withOpacity(0.1),
                    ),
                    foregroundColor: MaterialStateProperty.all<Color>(
                      AppColors.black,
                    ),
                  ),
                  onPressed: () {},
                  child: Row(
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
