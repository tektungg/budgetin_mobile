import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/about/controllers/about_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class PolicyCard extends GetView<AboutController> {
  const PolicyCard({super.key});

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
            'Policies & Terms',
            style: AppFonts.primaryBold16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 16.h),
          ...controller.policyLinks.map((policy) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _buildPolicyButton(policy),
              )),
        ],
      ),
    );
  }

  Widget _buildPolicyButton(dynamic policy) {
    return GestureDetector(
      onTap: () => controller.openPolicyLink(policy),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.border,
            width: 1.w,
          ),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              policy.title,
              style: AppFonts.primaryMedium14.copyWith(
                color: AppColors.text1_1000,
              ),
            ),
            Icon(
              Icons.open_in_new,
              size: 16.w,
              color: AppColors.text1_500,
            ),
          ],
        ),
      ),
    );
  }
}
