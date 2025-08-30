import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/controllers/setting_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class UserProfileCard extends GetView<SettingController> {
  const UserProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final userData = controller.userData;

      return Container(
        margin: EdgeInsets.symmetric(horizontal: 24.w),
        padding: EdgeInsets.all(20.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.1),
              blurRadius: 10.r,
              offset: Offset(0, 4.h),
            ),
          ],
        ),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 64.w,
              height: 64.h,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(32.r),
              ),
              child: Center(
                child: Text(
                  userData['name']
                      .toString()
                      .split(' ')
                      .map((n) => n.isNotEmpty ? n[0] : '')
                      .take(2)
                      .join('')
                      .toUpperCase(),
                  style: AppFonts.primaryBold18.copyWith(
                    color: AppColors.white,
                  ),
                ),
              ),
            ),

            SizedBox(width: 16.w),

            // User Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userData['name'],
                    style: AppFonts.primarySemiBold18.copyWith(
                      color: AppColors.text1_1000,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    userData['email'],
                    style: AppFonts.primaryRegular14.copyWith(
                      color: AppColors.text1_600,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    userData['joinDate'],
                    style: AppFonts.primaryRegular12.copyWith(
                      color: AppColors.text1_500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
