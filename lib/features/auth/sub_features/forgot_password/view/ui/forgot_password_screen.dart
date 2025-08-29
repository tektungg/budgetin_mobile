import 'package:budgetin/features/auth/sub_features/forgot_password/controllers/forgot_password_controller.dart';
import 'package:budgetin/shared/widgets/custom_text_field.dart';
import 'package:budgetin/shared/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Reset Password'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: controller.goBack,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              // Header
              Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.lock_reset,
                      size: 80.w,
                      color: Colors.blue,
                    ),
                    SizedBox(height: 16.h),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        fontSize: 28.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      'Enter your email address and we\'ll send you a link to reset your password',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
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

              // Email Field
              CustomTextField(
                labelText: 'Email',
                hintText: 'Enter your email address',
                controller: controller.emailController,
                validator: controller.validateEmail,
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.email_outlined),
                onChanged: (value) => controller.clearError(),
              ),

              SizedBox(height: 30.h),

              // Send Reset Email Button
              Obx(() => CustomButton(
                    text: 'Send Reset Email',
                    onPressed: controller.isLoading
                        ? null
                        : controller.sendResetPasswordEmail,
                    isLoading: controller.isLoading,
                    backgroundColor: Colors.blue,
                  )),

              SizedBox(height: 20.h),

              // Instructions
              Container(
                padding: EdgeInsets.all(16.w),
                decoration: BoxDecoration(
                  color: Colors.blue.shade50,
                  border: Border.all(color: Colors.blue.shade200),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.info_outline,
                          color: Colors.blue.shade600,
                          size: 20.w,
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          'Instructions',
                          style: TextStyle(
                            color: Colors.blue.shade700,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Text(
                      '1. Enter the email address associated with your account\n'
                      '2. Check your email for a password reset link\n'
                      '3. Click the link and follow the instructions\n'
                      '4. Create a new password for your account',
                      style: TextStyle(
                        color: Colors.blue.shade700,
                        fontSize: 14.sp,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
