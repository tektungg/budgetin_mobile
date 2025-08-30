import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/account_management/controllers/account_management_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class TotalBalanceCard extends GetView<AccountManagementController> {
  const TotalBalanceCard({super.key});

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
            'Total Balance of All Accounts',
            style: AppFonts.primaryBold16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 12.h),
          Obx(() => Text(
                controller.formatCurrency(controller.totalBalance),
                style: AppFonts.primaryBold24.copyWith(
                  color: AppColors.primary,
                ),
              )),
          SizedBox(height: 4.h),
          Obx(() => Text(
                '${controller.accounts.length} active accounts',
                style: AppFonts.primaryRegular12.copyWith(
                  color: AppColors.text1_500,
                ),
              )),
        ],
      ),
    );
  }
}
