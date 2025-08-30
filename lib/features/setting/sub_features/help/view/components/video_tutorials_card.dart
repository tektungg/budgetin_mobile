import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/help/controllers/help_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class VideoTutorialsCard extends GetView<HelpController> {
  const VideoTutorialsCard({super.key});

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
            'Video Tutorials',
            style: AppFonts.primaryBold16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 16.h),
          _buildComingSoonState(),
        ],
      ),
    );
  }

  Widget _buildComingSoonState() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32.h),
      child: Column(
        children: [
          Container(
            width: 64.w,
            height: 64.w,
            decoration: BoxDecoration(
              color: AppColors.background,
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text(
                '🎥',
                style: TextStyle(fontSize: 24.sp),
              ),
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Video Tutorials Coming Soon',
            style: AppFonts.primaryMedium16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'We are preparing comprehensive video tutorials to help you use Budgetin',
            textAlign: TextAlign.center,
            style: AppFonts.primaryRegular12.copyWith(
              color: AppColors.text1_500,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
