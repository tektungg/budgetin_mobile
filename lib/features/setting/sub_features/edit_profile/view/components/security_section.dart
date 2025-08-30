import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/edit_profile/controllers/edit_profile_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class SecuritySection extends GetView<EditProfileController> {
  const SecuritySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Security',
            style: AppFonts.primaryBold16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 20.h),

          // Change Password Button
          _buildSecurityButton(
            title: 'Change Password',
            icon: Icons.lock_outline,
            onTap: controller.handleChangePassword,
          ),

          SizedBox(height: 12.h),

          // Two Factor Authentication Button
          _buildSecurityButton(
            title: 'Set up 2-Factor Authentication',
            icon: Icons.security_outlined,
            onTap: controller.handleTwoFactorAuth,
          ),
        ],
      ),
    );
  }

  Widget _buildSecurityButton({
    required String title,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 12.h,
        ),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.border,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20.w,
              color: AppColors.text1_600,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Text(
                title,
                style: AppFonts.primaryMedium14.copyWith(
                  color: AppColors.text1_1000,
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.w,
              color: AppColors.text1_500,
            ),
          ],
        ),
      ),
    );
  }
}
