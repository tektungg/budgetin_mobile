import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_up/controllers/sign_up_controller.dart';
import 'package:budgetin/features/auth/sub_features/sign_up/view/components/components.dart';
import 'package:budgetin/shared/styles/styles.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(24.w),
        child: Form(
          key: controller.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20.h),

              // Header
              const SignUpHeader(),

              SizedBox(height: 40.h),

              // Error Message Display
              Obx(() => AuthErrorMessage(
                    errorMessage: controller.errorMessage,
                  )),

              // Form Fields
              const SignUpFormFields(),

              SizedBox(height: 30.h),

              // Sign Up Button
              const SignUpActionButton(),

              SizedBox(height: 20.h),

              // Sign In Link
              const SignUpFooter(),

              SizedBox(height: 40.h),
            ],
          ),
        ),
      ),
    );
  }
}
