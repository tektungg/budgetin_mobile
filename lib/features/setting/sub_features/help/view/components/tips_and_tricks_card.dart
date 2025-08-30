import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/help/controllers/help_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class TipsAndTricksCard extends GetView<HelpController> {
  const TipsAndTricksCard({super.key});

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
            'Tips & Tricks',
            style: AppFonts.primaryBold16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 16.h),
          ...controller.tipsCards.map((tip) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _buildTipItem(tip),
              )),
        ],
      ),
    );
  }

  Widget _buildTipItem(dynamic tip) {
    return Container(
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: tip.backgroundColor,
        borderRadius: BorderRadius.circular(8.r),
        border: Border(
          left: BorderSide(
            color: tip.borderColor,
            width: 4.w,
          ),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tip.emoji,
            style: TextStyle(fontSize: 16.sp),
          ),
          SizedBox(width: 12.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  tip.title,
                  style: AppFonts.primaryMedium14.copyWith(
                    color: tip.titleColor,
                  ),
                ),
                SizedBox(height: 4.h),
                Text(
                  tip.description,
                  style: AppFonts.primaryRegular12.copyWith(
                    color: tip.descriptionColor,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
