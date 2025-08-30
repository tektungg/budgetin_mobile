import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/report/controllers/report_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AccountsTab extends GetView<ReportController> {
  const AccountsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Account Performance Chart
        _buildAccountPerformanceChart(),

        SizedBox(height: 20.h),

        // Account Details
        _buildAccountDetails(),

        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildAccountPerformanceChart() {
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
            'Performance by Account',
            style: AppFonts.primarySemiBold16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 16.h),

          // Simple bar chart representation
          SizedBox(
            height: 300.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: controller.accountData.map((account) {
                return _buildAccountBar(
                  name: account['name'],
                  income: account['income'].toDouble(),
                  expense: account['expense'].toDouble(),
                );
              }).toList(),
            ),
          ),

          SizedBox(height: 16.h),

          // Legend
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildLegendItem('Income', AppColors.accent),
              SizedBox(width: 20.w),
              _buildLegendItem('Expense', AppColors.error),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildAccountBar({
    required String name,
    required double income,
    required double expense,
  }) {
    final maxValue = controller.accountData
        .expand((data) => [data['income'], data['expense']])
        .reduce((a, b) => a > b ? a : b)
        .toDouble();

    final incomeHeight = (income / maxValue) * 140.h;
    final expenseHeight = (expense / maxValue) * 140.h;

    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Income bar
        Container(
          width: 20.w,
          height: incomeHeight,
          margin: EdgeInsets.only(right: 4.w),
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        SizedBox(height: 4.h),
        // Expense bar
        Container(
          width: 20.w,
          height: expenseHeight,
          margin: EdgeInsets.only(right: 4.w),
          decoration: BoxDecoration(
            color: AppColors.error,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ),
        SizedBox(height: 8.h),
        // Account name
        Text(
          name,
          style: AppFonts.primaryRegular10.copyWith(
            color: AppColors.text1_600,
          ),
        ),
      ],
    );
  }

  Widget _buildAccountDetails() {
    return Container(
      width: double.infinity,
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
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Text(
              'Account Details',
              style: AppFonts.primarySemiBold16.copyWith(
                color: AppColors.text1_1000,
              ),
            ),
          ),

          // Account items
          ...controller.accountData.asMap().entries.map((entry) {
            final index = entry.key;
            final account = entry.value;
            final isLast = index == controller.accountData.length - 1;

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
              decoration: BoxDecoration(
                border: isLast
                    ? null
                    : Border(
                        bottom: BorderSide(
                          color: AppColors.border,
                          width: 1,
                        ),
                      ),
              ),
              child: Column(
                children: [
                  // Account name and balance
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        account['name'],
                        style: AppFonts.primarySemiBold16.copyWith(
                          color: AppColors.text1_1000,
                        ),
                      ),
                      Text(
                        controller
                            .formatCurrency(account['balance'].toDouble()),
                        style: AppFonts.primaryBold16.copyWith(
                          color: AppColors.primary,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 12.h),

                  // Income and expense details
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Income',
                              style: AppFonts.primaryRegular12.copyWith(
                                color: AppColors.text1_500,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              controller
                                  .formatCurrency(account['income'].toDouble()),
                              style: AppFonts.primarySemiBold14.copyWith(
                                color: AppColors.success,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Expense',
                              style: AppFonts.primaryRegular12.copyWith(
                                color: AppColors.text1_500,
                              ),
                            ),
                            SizedBox(height: 2.h),
                            Text(
                              controller.formatCurrency(
                                  account['expense'].toDouble()),
                              style: AppFonts.primarySemiBold14.copyWith(
                                color: AppColors.error,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildLegendItem(String label, Color color) {
    return Row(
      children: [
        Container(
          width: 12.w,
          height: 12.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(width: 6.w),
        Text(
          label,
          style: AppFonts.primaryRegular12.copyWith(
            color: AppColors.text1_600,
          ),
        ),
      ],
    );
  }
}
