import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_up/controllers/sign_up_controller.dart';
import 'package:budgetin/shared/widgets/custom_text_field.dart';
import 'package:budgetin/shared/widgets/custom_button.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              // Welcome text
              Text(
                'Create Your Account',
                style: TextStyle(
                  fontSize: 28.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                'Fill in your details to get started',
                style: TextStyle(
                  fontSize: 16.sp,
                  color: Colors.grey[600],
                ),
              ),

              SizedBox(height: 40.h),

              // Error Message Display
              Obx(() {
                final errorMessage = controller.errorMessage;
                if (errorMessage.isNotEmpty) {
                  return Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(12.w),
                    margin: EdgeInsets.only(bottom: 16.h),
                    decoration: BoxDecoration(
                      color: Colors.red.shade50,
                      border: Border.all(color: Colors.red.shade200),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.error_outline,
                          color: Colors.red.shade600,
                          size: 20.w,
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: Text(
                            errorMessage,
                            style: TextStyle(
                              color: Colors.red.shade700,
                              fontSize: 14.sp,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              }),

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

              SizedBox(height: 20.h),

              // Terms and Conditions
              Obx(() => Row(
                    children: [
                      Checkbox(
                        value: controller.acceptTerms,
                        onChanged: controller.toggleAcceptTerms,
                      ),
                      Expanded(
                        child: Text(
                          'I agree to the Terms and Conditions and Privacy Policy',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: Colors.grey[700],
                          ),
                        ),
                      ),
                    ],
                  )),

              SizedBox(height: 30.h),

              // Sign Up Button
              Obx(() => CustomButton(
                    text: 'Create Account',
                    onPressed: controller.isLoading ? null : controller.signUp,
                    isLoading: controller.isLoading,
                  )),

              SizedBox(height: 20.h),

              // Sign In Link
              Center(
                child: TextButton(
                  onPressed: controller.goToSignIn,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                      children: [
                        const TextSpan(text: 'Already have an account? '),
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
