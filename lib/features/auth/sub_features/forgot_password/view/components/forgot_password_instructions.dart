import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordInstructions extends StatelessWidget {
  const ForgotPasswordInstructions({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        border: Border.all(color: Colors.blue.shade200),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.info_outline,
                color: Colors.blue.shade600,
                size: 20.w,
              ),
              SizedBox(width: 8.w),
              Text(
                'Instructions',
                style: TextStyle(
                  color: Colors.blue.shade700,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w600,
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
            style: TextStyle(
              color: Colors.blue.shade700,
              fontSize: 14.sp,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
