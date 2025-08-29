import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_up/controllers/sign_up_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class SignUpTermsConditions extends GetView<SignUpController> {
  const SignUpTermsConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Row(
          children: [
            Checkbox(
              value: controller.acceptTerms,
              onChanged: controller.toggleAcceptTerms,
              activeColor: AppColors.primary,
            ),
            Expanded(
              child: Text(
                'I agree to the Terms and Conditions and Privacy Policy',
                style: AppFonts.primaryRegular14.copyWith(
                  color: AppColors.text1_700,
                ),
              ),
            ),
          ],
        ));
  }
}
