import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_up/controllers/sign_up_controller.dart';
import 'package:budgetin/shared/widgets/custom_text_field.dart';

class SignUpFormFields extends GetView<SignUpController> {
  const SignUpFormFields({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Full Name Field
        CustomTextField(
          labelText: 'Full Name',
          hintText: 'Enter your full name',
          controller: controller.fullNameController,
          keyboardType: TextInputType.name,
          validator: controller.validateFullName,
          onChanged: (value) => controller.clearError(),
        ),

        SizedBox(height: 20.h),

        // Email Field
        CustomTextField(
          labelText: 'Email',
          hintText: 'Enter your email address',
          controller: controller.emailController,
          keyboardType: TextInputType.emailAddress,
          validator: controller.validateEmail,
          onChanged: (value) => controller.clearError(),
        ),

        SizedBox(height: 20.h),

        // Password Field
        Obx(() => CustomTextField(
              labelText: 'Password',
              hintText: 'Enter your password',
              controller: controller.passwordController,
              obscureText: !controller.isPasswordVisible,
              validator: controller.validatePassword,
              onChanged: (value) => controller.clearError(),
              suffixIcon: IconButton(
                onPressed: controller.togglePasswordVisibility,
                icon: Icon(
                  controller.isPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            )),

        SizedBox(height: 20.h),

        // Confirm Password Field
        Obx(() => CustomTextField(
              labelText: 'Confirm Password',
              hintText: 'Confirm your password',
              controller: controller.confirmPasswordController,
              obscureText: !controller.isConfirmPasswordVisible,
              validator: controller.validateConfirmPassword,
              onChanged: (value) => controller.clearError(),
              suffixIcon: IconButton(
                onPressed: controller.toggleConfirmPasswordVisibility,
                icon: Icon(
                  controller.isConfirmPasswordVisible
                      ? Icons.visibility_off
                      : Icons.visibility,
                ),
              ),
            )),
      ],
    );
  }
}
