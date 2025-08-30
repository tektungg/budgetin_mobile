import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/about/controllers/about_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class CopyrightCard extends GetView<AboutController> {
  const CopyrightCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
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
          Text(
            '© 2024 Budgetin. All rights reserved.',
            textAlign: TextAlign.center,
            style: AppFonts.primaryRegular12.copyWith(
              color: AppColors.text1_500,
            ),
          ),
          SizedBox(height: 4.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Made with ',
                style: AppFonts.primaryRegular12.copyWith(
                  color: AppColors.text1_400,
                ),
              ),
              Text(
                '❤️',
                style: TextStyle(fontSize: 12.sp),
              ),
              Text(
                ' for Indonesian community',
                style: AppFonts.primaryRegular12.copyWith(
                  color: AppColors.text1_400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
