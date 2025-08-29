import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/controllers/sign_in_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class SignInOptions extends GetView<SignInController> {
  const SignInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => Row(
              children: [
                Checkbox(
                  value: controller.rememberMe,
                  onChanged: controller.toggleRememberMe,
                  activeColor: AppColors.primary,
                ),
                Text(
                  'Remember me',
                  style: AppFonts.primaryRegular14.copyWith(
                    color: AppColors.text1_600,
                  ),
                ),
              ],
            )),
        TextButton(
          onPressed: controller.goToForgotPassword,
          child: Text(
            'Forgot Password?',
            style: AppFonts.primaryMedium14.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),
      ],
    );
  }
}
