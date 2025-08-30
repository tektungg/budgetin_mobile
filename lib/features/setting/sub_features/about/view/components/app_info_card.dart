import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/about/controllers/about_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AppInfoCard extends GetView<AboutController> {
  const AppInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(24.w),
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
        children: [
          // App Logo
          Container(
            width: 80.w,
            height: 80.w,
            decoration: BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                'B',
                style: AppFonts.primaryBold32.copyWith(
                  color: AppColors.white,
                ),
              ),
            ),
          ),

          SizedBox(height: 16.h),

          // App Name
          Text(
            controller.appInfo.name,
            style: AppFonts.primaryBold24.copyWith(
              color: AppColors.text1_1000,
            ),
          ),

          SizedBox(height: 8.h),

          // App Description
          Text(
            controller.appInfo.description,
            textAlign: TextAlign.center,
            style: AppFonts.primaryRegular14.copyWith(
              color: AppColors.text1_600,
              height: 1.4,
            ),
          ),

          SizedBox(height: 24.h),

          // Stats Grid
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildStatItem(
                value: controller.appInfo.version,
                label: 'Version',
                color: AppColors.primary,
              ),
              _buildStatItem(
                value: controller.appInfo.releaseYear,
                label: 'Release Year',
                color: AppColors.accent,
              ),
              _buildStatItem(
                value: controller.appInfo.rating,
                label: 'Rating',
                color: AppColors.warning,
              ),
            ],
          ),

          SizedBox(height: 24.h),

          // Action Buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => controller.rateApp(),
                  icon: Icon(
                    Icons.star,
                    size: 16.w,
                    color: AppColors.primary,
                  ),
                  label: Text(
                    'Rate App',
                    style: AppFonts.primaryMedium14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primary),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12.w),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () => controller.openWebsite(),
                  icon: Icon(
                    Icons.open_in_new,
                    size: 16.w,
                    color: AppColors.primary,
                  ),
                  label: Text(
                    'Website',
                    style: AppFonts.primaryMedium14.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: AppColors.primary),
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildStatItem({
    required String value,
    required String label,
    required Color color,
  }) {
    return Column(
      children: [
        Text(
          value,
          style: AppFonts.primaryBold18.copyWith(
            color: color,
          ),
        ),
        SizedBox(height: 4.h),
        Text(
          label,
          style: AppFonts.primaryRegular12.copyWith(
            color: AppColors.text1_500,
          ),
        ),
      ],
    );
  }
}
