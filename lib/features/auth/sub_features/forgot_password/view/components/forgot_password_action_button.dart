import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/forgot_password/controllers/forgot_password_controller.dart';
import 'package:budgetin/shared/widgets/custom_button.dart';
import 'package:budgetin/shared/styles/styles.dart';

class ForgotPasswordActionButton extends GetView<ForgotPasswordController> {
  const ForgotPasswordActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => CustomButton(
          text: 'Send Reset Email',
          onPressed:
              controller.isLoading ? null : controller.sendResetPasswordEmail,
          isLoading: controller.isLoading,
          backgroundColor: AppColors.primary,
        ));
  }
}
