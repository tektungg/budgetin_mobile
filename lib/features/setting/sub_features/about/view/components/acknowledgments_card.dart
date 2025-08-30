import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/about/controllers/about_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AcknowledgmentsCard extends GetView<AboutController> {
  const AcknowledgmentsCard({super.key});

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
            'Acknowledgments',
            style: AppFonts.primaryBold16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 12.h),
          Text(
            'Thanks to the open source community that has contributed:',
            style: AppFonts.primaryRegular12.copyWith(
              color: AppColors.text1_600,
            ),
          ),
          SizedBox(height: 12.h),
          ...controller.acknowledgments.map((item) => Padding(
                padding: EdgeInsets.only(bottom: 8.h),
                child: _buildAcknowledgmentItem(item),
              )),
        ],
      ),
    );
  }

  Widget _buildAcknowledgmentItem(String item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 8.w,
          height: 8.w,
          margin: EdgeInsets.only(top: 6.h, right: 8.w),
          decoration: BoxDecoration(
            color: AppColors.text1_400,
            shape: BoxShape.circle,
          ),
        ),
        Expanded(
          child: Text(
            item,
            style: AppFonts.primaryRegular12.copyWith(
              color: AppColors.text1_600,
            ),
          ),
        ),
      ],
    );
  }
}
