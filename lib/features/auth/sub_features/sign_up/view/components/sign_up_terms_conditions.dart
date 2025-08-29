import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_up/controllers/sign_up_controller.dart';

class SignUpTermsConditions extends GetView<SignUpController> {
  const SignUpTermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
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
        ));
  }
}
