import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/controllers/sign_in_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class SignInFooter extends GetView<SignInController> {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Don't have an account? ",
            style: AppFonts.primaryRegular14.copyWith(
              color: AppColors.text1_600,
            ),
          ),
          GestureDetector(
            onTap: controller.goToSignUp,
            child: Text(
              'Sign Up',
              style: AppFonts.primarySemiBold14.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
