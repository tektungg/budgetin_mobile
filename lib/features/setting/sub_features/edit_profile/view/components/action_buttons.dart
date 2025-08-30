import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/edit_profile/controllers/edit_profile_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class ActionButtons extends GetView<EditProfileController> {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Cancel Button
        Expanded(
          child: GestureDetector(
            onTap: controller.navigateBack,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 14.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.border,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Center(
                child: Text(
                  'Cancel',
                  style: AppFonts.primaryMedium14.copyWith(
                    color: AppColors.text1_1000,
                  ),
                ),
              ),
            ),
          ),
        ),

        SizedBox(width: 12.w),

        // Save Button
        Expanded(
          child: Obx(() {
            return GestureDetector(
              onTap: controller.isLoading ? null : controller.handleSaveProfile,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 14.h),
                decoration: BoxDecoration(
                  color: controller.isLoading
                      ? AppColors.primary.withValues(alpha: 0.6)
                      : AppColors.primary,
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Center(
                  child: controller.isLoading
                      ? SizedBox(
                          width: 20.w,
                          height: 20.w,
                          child: CircularProgressIndicator(
                            strokeWidth: 2.w,
                            valueColor: AlwaysStoppedAnimation<Color>(
                              AppColors.white,
                            ),
                          ),
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.save,
                              size: 16.w,
                              color: AppColors.white,
                            ),
                            SizedBox(width: 8.w),
                            Text(
                              'Save',
                              style: AppFonts.primaryMedium14.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        ),
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
