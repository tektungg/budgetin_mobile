import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_up/controllers/sign_up_controller.dart';
import 'package:budgetin/shared/widgets/custom_button.dart';
import 'package:budgetin/shared/styles/styles.dart';

class SignUpActionButton extends GetView<SignUpController> {
  const SignUpActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomButton(
          text: 'Create Account',
          onPressed: controller.isLoading ? null : controller.signUp,
          isLoading: controller.isLoading,
          backgroundColor: AppColors.primary,
        ));
  }
}
