import 'package:budgetin/features/auth/sub_features/forgot_password/controllers/forgot_password_controller.dart';
import 'package:budgetin/features/auth/sub_features/forgot_password/view/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const ForgotPasswordAppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              // Header
              const ForgotPasswordHeader(),

              SizedBox(height: 40.h),

              // Error Message Display
              Obx(() => AuthErrorMessage(
                    errorMessage: controller.errorMessage,
                  )),

              // Email Field
              const ForgotPasswordEmailField(),

              SizedBox(height: 30.h),

              // Send Reset Email Button
              const ForgotPasswordActionButton(),

              SizedBox(height: 20.h),

              // Instructions
              const ForgotPasswordInstructions(),
            ],
          ),
        ),
      ),
    );
  }
}
