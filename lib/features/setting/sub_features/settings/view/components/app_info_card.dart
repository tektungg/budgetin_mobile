import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/settings/controllers/settings_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AppInfoCard extends GetView<SettingsController> {
  const AppInfoCard({super.key});

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
          Row(
            children: [
              Icon(
                Icons.info,
                size: 16.w,
                color: AppColors.text1_1000,
              ),
              SizedBox(width: 8.w),
              Text(
                'App Information',
                style: AppFonts.primaryBold16.copyWith(
                  color: AppColors.text1_1000,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Column(
            children: [
              _buildInfoItem(
                title: 'App Version',
                value: '1.0.0',
              ),
              SizedBox(height: 16.h),
              _buildInfoItem(
                title: 'Build Number',
                value: '100',
              ),
              SizedBox(height: 16.h),
              _buildActionItem(
                title: 'Privacy Policy',
                subtitle: 'Read our privacy policy',
                icon: Icons.privacy_tip,
                onTap: () => controller.openPrivacyPolicy(),
              ),
              SizedBox(height: 16.h),
              _buildActionItem(
                title: 'Terms of Service',
                subtitle: 'View terms and conditions',
                icon: Icons.description,
                onTap: () => controller.openTermsOfService(),
              ),
              SizedBox(height: 16.h),
              _buildActionItem(
                title: 'Contact Support',
                subtitle: 'Get help or report issues',
                icon: Icons.support_agent,
                onTap: () => controller.contactSupport(),
              ),
              SizedBox(height: 16.h),
              _buildActionItem(
                title: 'Rate App',
                subtitle: 'Rate us on the app store',
                icon: Icons.star_rate,
                onTap: () => controller.rateApp(),
              ),
              SizedBox(height: 16.h),
              _buildActionItem(
                title: 'Check for Updates',
                subtitle: 'See if there\'s a new version available',
                icon: Icons.system_update,
                onTap: () => controller.checkForUpdates(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInfoItem({
    required String title,
    required String value,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppFonts.primaryMedium14.copyWith(
            color: AppColors.text1_1000,
          ),
        ),
        Text(
          value,
          style: AppFonts.primaryRegular14.copyWith(
            color: AppColors.text1_500,
          ),
        ),
      ],
    );
  }

  Widget _buildActionItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.border,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 20.w,
              color: AppColors.primary,
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppFonts.primaryMedium14.copyWith(
                      color: AppColors.text1_1000,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: AppFonts.primaryRegular12.copyWith(
                      color: AppColors.text1_500,
                    ),
                  ),
                ],
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
