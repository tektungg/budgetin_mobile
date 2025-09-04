import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/edit_profile/controllers/edit_profile_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/shared/widgets/custom_button.dart';

class ActionButtons extends GetView<EditProfileController> {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Cancel Button
        Expanded(
          child: CustomButton(
            text: 'Cancel',
            onPressed: controller.navigateBack,
            backgroundColor: AppColors.white,
            textColor: AppColors.text1_1000,
            borderColor: AppColors.border,
            borderWidth: 1,
            borderRadius: 8.r,
            height: 46.h,
          ),
        ),

        SizedBox(width: 12.w),

        // Save Button
        Expanded(
          child: Obx(() {
            return CustomButton(
              text: 'Save',
              onPressed:
                  controller.isLoading ? null : controller.handleSaveProfile,
              isLoading: controller.isLoading,
              backgroundColor: AppColors.primary,
              textColor: AppColors.white,
              borderRadius: 8.r,
              height: 46.h,
              icon: controller.isLoading
                  ? null
                  : Icon(
                      Icons.save,
                      size: 16.w,
                      color: AppColors.white,
                    ),
            );
          }),
        ),
      ],
    );
  }
}
