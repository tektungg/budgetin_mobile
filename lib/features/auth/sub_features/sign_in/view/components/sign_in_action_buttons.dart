import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/controllers/sign_in_controller.dart';
import 'package:budgetin/shared/widgets/custom_button.dart';

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
              backgroundColor: Colors.blue,
            )),

        SizedBox(height: 20.h),

        // Divider
        Row(
          children: [
            Expanded(child: Divider(color: Colors.grey[300])),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Text(
                'or',
                style: TextStyle(
                  fontSize: 14.sp,
                  color: Colors.grey[600],
                ),
              ),
            ),
            Expanded(child: Divider(color: Colors.grey[300])),
          ],
        ),

        SizedBox(height: 20.h),

        // Google Sign In Button
        Obx(() => CustomButton(
              text: 'Continue with Google',
              onPressed: controller.signInWithGoogle,
              isLoading: controller.isLoading,
              backgroundColor: Colors.white,
              textColor: Colors.grey[800],
              icon: Icon(
                Icons.g_mobiledata,
                size: 24.w,
                color: Colors.red,
              ),
            )),
      ],
    );
  }
}
