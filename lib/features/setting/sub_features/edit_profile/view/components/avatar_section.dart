import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/edit_profile/controllers/edit_profile_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AvatarSection extends GetView<EditProfileController> {
  const AvatarSection({super.key});

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
        children: [
          Stack(
            children: [
              Obx(() {
                return CircleAvatar(
                  radius: 40.r,
                  backgroundColor: AppColors.primary,
                  backgroundImage: controller.avatar.isNotEmpty
                      ? NetworkImage(controller.avatar)
                      : null,
                  child: controller.avatar.isEmpty
                      ? Text(
                          controller.getInitials(),
                          style: AppFonts.primaryBold20.copyWith(
                            color: AppColors.white,
                          ),
                        )
                      : null,
                );
              }),
              Positioned(
                bottom: -2,
                right: -2,
                child: GestureDetector(
                  onTap: controller.handleAvatarChange,
                  child: Container(
                    padding: EdgeInsets.all(8.w),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.black.withValues(alpha: 0.1),
                          blurRadius: 4.r,
                          offset: Offset(0, 2.h),
                        ),
                      ],
                      border: Border.all(
                        color: AppColors.border,
                        width: 1.w,
                      ),
                    ),
                    child: Icon(
                      Icons.camera_alt,
                      size: 16.w,
                      color: AppColors.text1_600,
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Column(
            children: [
              Text(
                'Profile Photo',
                style: AppFonts.primaryMedium14.copyWith(
                  color: AppColors.text1_1000,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                'Click camera icon to change photo',
                style: AppFonts.primaryRegular12.copyWith(
                  color: AppColors.text1_500,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
