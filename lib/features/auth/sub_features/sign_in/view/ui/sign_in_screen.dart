import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/controllers/sign_in_controller.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/view/components/components.dart';

class SignInScreen extends GetView<SignInController> {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Form(
            key: controller.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 60.h),

                // Header
                const SignInHeader(),

                SizedBox(height: 40.h),

                // Error Message Display
                Obx(() => SignInErrorMessage(
                      errorMessage: controller.errorMessage,
                    )),

                // Form Fields
                const SignInFormFields(),

                SizedBox(height: 12.h),

                // Remember Me & Forgot Password
                const SignInOptions(),

                SizedBox(height: 24.h),

                // Action Buttons
                const SignInActionButtons(),

                SizedBox(height: 30.h),

                // Sign Up Link
                const SignInFooter(),

                SizedBox(height: 40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
