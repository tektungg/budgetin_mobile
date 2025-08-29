import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budgetin/shared/styles/styles.dart';

class SignUpHeader extends StatelessWidget {
  const SignUpHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Create Your Account',
          style: AppFonts.brandingBold28.copyWith(
            color: AppColors.text1_1000,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'Fill in your details to get started',
          style: AppFonts.primaryRegular16.copyWith(
            color: AppColors.text1_600,
          ),
        ),
      ],
    );
  }
}
