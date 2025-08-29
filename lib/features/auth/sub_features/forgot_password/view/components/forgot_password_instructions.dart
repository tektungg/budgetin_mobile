import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budgetin/shared/styles/styles.dart';

class ForgotPasswordInstructions extends StatelessWidget {
  const ForgotPasswordInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.info.withOpacity(0.1),
        border: Border.all(color: AppColors.info.withOpacity(0.3)),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: AppColors.info,
                size: 20.w,
              ),
              SizedBox(width: 8.w),
              Text(
                'Instructions',
                style: AppFonts.primarySemiBold16.copyWith(
                  color: AppColors.info,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            '1. Enter the email address associated with your account\n'
            '2. Check your email for a password reset link\n'
            '3. Click the link and follow the instructions\n'
            '4. Create a new password for your account',
            style: AppFonts.primaryRegular14.copyWith(
              color: AppColors.info,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
