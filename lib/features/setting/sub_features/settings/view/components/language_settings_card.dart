import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/settings/controllers/settings_controller.dart';
import 'package:budgetin/features/setting/sub_features/settings/models/settings_model.dart';
import 'package:budgetin/shared/styles/styles.dart';

class LanguageSettingsCard extends GetView<SettingsController> {
  const LanguageSettingsCard({super.key});

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
                Icons.language,
                size: 16.w,
                color: AppColors.text1_1000,
              ),
              SizedBox(width: 8.w),
              Text(
                'Language',
                style: AppFonts.primaryBold16.copyWith(
                  color: AppColors.text1_1000,
                ),
              ),
            ],
          ),
          SizedBox(height: 16.h),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'App Language',
                      style: AppFonts.primaryMedium14.copyWith(
                        color: AppColors.text1_1000,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      'Choose language for app interface',
                      style: AppFonts.primaryRegular12.copyWith(
                        color: AppColors.text1_500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12.h),
          Obx(() {
            return Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
              decoration: BoxDecoration(
                border: Border.all(
                  color: AppColors.border,
                  width: 1.w,
                ),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: DropdownButton<String>(
                dropdownColor: AppColors.white,
                borderRadius: BorderRadius.circular(12.r),
                value: controller.selectedLanguage,
                isExpanded: true,
                underline: Container(),
                onChanged: (String? value) {
                  if (value != null) {
                    controller.setLanguage(value);
                  }
                },
                items: controller.languages
                    .map<DropdownMenuItem<String>>((Language language) {
                  return DropdownMenuItem<String>(
                    value: language.value,
                    child: Row(
                      children: [
                        Text(
                          language.flag,
                          style: TextStyle(fontSize: 16.sp),
                        ),
                        SizedBox(width: 8.w),
                        Text(
                          language.label,
                          style: AppFonts.primaryRegular14.copyWith(
                            color: AppColors.text1_1000,
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            );
          }),
        ],
      ),
    );
  }
}
