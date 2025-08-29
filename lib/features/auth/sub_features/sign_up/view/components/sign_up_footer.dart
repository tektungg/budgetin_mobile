import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_up/controllers/sign_up_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class SignUpFooter extends GetView<SignUpController> {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        onPressed: controller.goToSignIn,
        child: RichText(
          text: TextSpan(
            style: AppFonts.primaryRegular16.copyWith(
              color: AppColors.text1_600,
            ),
            children: [
              const TextSpan(text: 'Already have an account? '),
              TextSpan(
                text: 'Sign In',
                style: AppFonts.primarySemiBold16.copyWith(
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
