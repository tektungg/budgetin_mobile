import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/forgot_password/controllers/forgot_password_controller.dart';
import 'package:budgetin/shared/widgets/custom_text_field.dart';

class ForgotPasswordEmailField extends GetView<ForgotPasswordController> {
  const ForgotPasswordEmailField({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomTextField(
      labelText: 'Email',
      hintText: 'Enter your email address',
      controller: controller.emailController,
      validator: controller.validateEmail,
      keyboardType: TextInputType.emailAddress,
      prefixIcon: const Icon(Icons.email_outlined),
      onChanged: (value) => controller.clearError(),
    );
  }
}
