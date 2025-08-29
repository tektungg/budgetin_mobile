import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/controllers/sign_in_controller.dart';
import 'package:budgetin/shared/widgets/custom_button.dart';
import 'package:budgetin/shared/styles/styles.dart';

class SignInActionButtons extends GetView<SignInController> {
  const SignInActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Sign In Button
        Obx(() => CustomButton(
              text: 'Sign In',
              onPressed: controller.signIn,
              isLoading: controller.isLoading,
              backgroundColor: AppColors.primary,
            )),

        SizedBox(height: 20.h),

        // Divider
        Row(
          children: [
            Expanded(child: Divider(color: AppColors.border)),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'or',
                style: AppFonts.primaryRegular14.copyWith(
                  color: AppColors.text1_600,
                ),
              ),
            ),
            Expanded(child: Divider(color: AppColors.border)),
          ],
        ),

        SizedBox(height: 20.h),

        // Google Sign In Button
        Obx(() => CustomButton(
              text: 'Continue with Google',
              onPressed: controller.signInWithGoogle,
              isLoading: controller.isLoading,
              backgroundColor: AppColors.white,
              textColor: AppColors.text1_800,
              icon: Icon(
                Icons.g_mobiledata,
                size: 24.w,
                color: AppColors.error,
              ),
            )),
      ],
    );
  }
}
