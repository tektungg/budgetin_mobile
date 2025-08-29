import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/controllers/sign_in_controller.dart';

class SignInOptions extends GetView<SignInController> {
  const SignInOptions({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Obx(() => Row(
              children: [
                Checkbox(
                  value: controller.rememberMe,
                  onChanged: controller.toggleRememberMe,
                  activeColor: Colors.blue,
                ),
                Text(
                  'Remember me',
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            )),
        TextButton(
          onPressed: controller.goToForgotPassword,
          child: Text(
            'Forgot Password?',
            style: TextStyle(
              fontSize: 14.sp,
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
