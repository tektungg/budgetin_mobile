import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/controllers/sign_in_controller.dart';
import 'package:budgetin/shared/widgets/custom_text_field.dart';

class SignInFormFields extends GetView<SignInController> {
  const SignInFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Email Field
        CustomTextField(
          labelText: 'Email',
          hintText: 'Enter your email',
          controller: controller.emailController,
          validator: controller.validateEmail,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: const Icon(Icons.email_outlined),
          onChanged: (value) => controller.clearError(),
        ),

        SizedBox(height: 16.h),

        // Password Field
        Obx(() => CustomTextField(
              labelText: 'Password',
              hintText: 'Enter your password',
              controller: controller.passwordController,
              validator: controller.validatePassword,
              obscureText: !controller.isPasswordVisible,
              prefixIcon: const Icon(Icons.lock_outline),
              onChanged: (value) => controller.clearError(),
              suffixIcon: IconButton(
                icon: Icon(
                  controller.isPasswordVisible
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: controller.togglePasswordVisibility,
              ),
            )),
      ],
    );
  }
}
