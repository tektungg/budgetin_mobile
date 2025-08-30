import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/settings/controllers/settings_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AppearanceSettingsCard extends GetView<SettingsController> {
  const AppearanceSettingsCard({super.key});

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
                Icons.palette,
                size: 16.w,
                color: AppColors.text1_1000,
              ),
              SizedBox(width: 8.w),
              Text(
                'Appearance',
                style: AppFonts.primaryBold16.copyWith(
                  color: AppColors.text1_1000,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Obx(() => Column(
                children: [
                  _buildAppearanceItem(
                    title: 'Dark Mode',
                    subtitle: 'Switch to dark theme',
                    value: controller.appearanceSettings.darkMode,
                    onChanged: () =>
                        controller.toggleAppearanceSetting('darkMode'),
                  ),
                  SizedBox(height: 16.h),
                  _buildAppearanceItem(
                    title: 'Auto Download',
                    subtitle: 'Automatically download attachments',
                    value: controller.appearanceSettings.autoDownload,
                    onChanged: () =>
                        controller.toggleAppearanceSetting('autoDownload'),
                  ),
                ],
              )),
        ],
      ),
    );
  }

  Widget _buildAppearanceItem({
    required String title,
    required String subtitle,
    required bool value,
    required VoidCallback onChanged,
  }) {
    return Row(
      children: [
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
        SizedBox(width: 16.w),
        GestureDetector(
          onTap: onChanged,
          child: Container(
            width: 44.w,
            height: 24.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
              color: value ? AppColors.primary : AppColors.text1_300,
            ),
            child: AnimatedAlign(
              alignment: value ? Alignment.centerRight : Alignment.centerLeft,
              duration: const Duration(milliseconds: 200),
              child: Container(
                width: 20.w,
                height: 20.h,
                margin: EdgeInsets.all(2.w),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
