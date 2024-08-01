import 'package:cinehanzo/core/ui/ui.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/core.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.transparent,
        toolbarHeight: 130,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Stack(
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
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Ainda não tem uma conta?",
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
              child: const Text("Cadastre-se!"),
            ),
          ],
        ),
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                textAlign: TextAlign.left,
                "Bem-vindo de volta!",
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
                  "Entre com suas credenciais para acessar sua conta.",
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
            ),
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
                  onPressed: () {},
                  icon: const Icon(Icons.visibility_off_outlined),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              bottom: 16,
            ),
            child: Row(
              children: [
                Checkbox(
                  value: true,
                  activeColor: AppColors.pink,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  onChanged: (value) {},
                ),
                const Expanded(
                  child: Text(
                    textAlign: TextAlign.left,
                    "Eu li e concordo com os Termos de Serviço e Políticas de Privacidade.",
                    style: TextStyle(
                      color: AppColors.black,
                      fontWeight: FontWeight.normal,
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
            onPressed: () {},
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
      ),
    );
  }
}
