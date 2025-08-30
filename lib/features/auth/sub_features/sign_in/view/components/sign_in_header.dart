import 'package:budgetin/constants/asset_constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budgetin/shared/styles/styles.dart';

class SignInHeader extends StatelessWidget {
  const SignInHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Image.asset(
            AssetConstants.logoBudgetin,
            width: 120.w,
          ),
          SizedBox(height: 16.h),
          Text(
            'Welcome Back',
            style: AppFonts.brandingBold28.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 8.h),
          Text(
            'Sign in to continue to Budgetin',
            style: AppFonts.primaryRegular16.copyWith(
              color: AppColors.text1_600,
            ),
          ),
        ],
      ),
    );
  }
}
