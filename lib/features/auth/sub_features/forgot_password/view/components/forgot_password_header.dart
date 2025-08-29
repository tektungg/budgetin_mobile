import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budgetin/shared/styles/styles.dart';

class ForgotPasswordHeader extends StatelessWidget {
  const ForgotPasswordHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Icon(
            Icons.lock_reset,
            size: 80.w,
            color: AppColors.primary,
          ),
          SizedBox(height: 16.h),
          Text(
            'Forgot Password?',
            style: AppFonts.brandingBold28.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Enter your email address and we\'ll send you a link to reset your password',
            style: AppFonts.primaryRegular16.copyWith(
              color: AppColors.text1_600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
