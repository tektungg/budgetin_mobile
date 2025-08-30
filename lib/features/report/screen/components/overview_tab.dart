import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/report/controllers/report_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class OverviewTab extends GetView<ReportController> {
  const OverviewTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Column(
          children: [
            // Summary Cards
            _buildSummaryCards(),

            SizedBox(height: 20.h),

            // Net Income Card
            _buildNetIncomeCard(),

            SizedBox(height: 20.h),

            // Income vs Expense Chart
            _buildIncomeExpenseChart(),

            SizedBox(height: 20.h),
          ],
        ));
  }

  Widget _buildSummaryCards() {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 8.w),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Income',
                          style: AppFonts.primaryRegular12.copyWith(
                            color: AppColors.text1_600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          controller.formatCurrency(controller.totalIncome),
                          style: AppFonts.primaryBold16.copyWith(
                            color: AppColors.accent,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: AppColors.success.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.trending_up,
                        color: AppColors.success,
                        size: 16.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 8.w),
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Total Expense',
                          style: AppFonts.primaryRegular12.copyWith(
                            color: AppColors.text1_600,
                          ),
                        ),
                        SizedBox(height: 4.h),
                        Text(
                          controller.formatCurrency(controller.totalExpense),
                          style: AppFonts.primaryBold16.copyWith(
                            color: AppColors.error,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.all(8.w),
                      decoration: BoxDecoration(
                        color: AppColors.error.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Icon(
                        Icons.trending_down,
                        color: AppColors.error,
                        size: 16.w,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNetIncomeCard() {
    final netIncome = controller.netIncome;
    final expenseGrowth = controller.expenseGrowth;
    final isPositive = netIncome >= 0;

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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Net Balance',
                style: AppFonts.primaryRegular14.copyWith(
                  color: AppColors.text1_600,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                controller.formatCurrency(netIncome),
                style: AppFonts.primaryBold20.copyWith(
                  color: isPositive ? AppColors.success : AppColors.error,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                '${isPositive ? 'Surplus' : 'Deficit'} this month',
                style: AppFonts.primaryRegular12.copyWith(
                  color: AppColors.text1_500,
                ),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Row(
                children: [
                  Icon(
                    expenseGrowth > 0 ? Icons.trending_up : Icons.trending_down,
                    color:
                        expenseGrowth > 0 ? AppColors.error : AppColors.success,
                    size: 16.w,
                  ),
                  SizedBox(width: 4.w),
                  Text(
                    '${expenseGrowth.abs().toStringAsFixed(1)}%',
                    style: AppFonts.primarySemiBold14.copyWith(
                      color: expenseGrowth > 0
                          ? AppColors.error
                          : AppColors.success,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Text(
                'vs last month',
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

  Widget _buildIncomeExpenseChart() {
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
            'Income vs Expense',
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
              children: controller.monthlyData.map((data) {
                return _buildChartBar(
                  month: data['month'],
                  income: data['income'].toDouble(),
                  expense: data['expense'].toDouble(),
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

  Widget _buildChartBar({
    required String month,
    required double income,
    required double expense,
  }) {
    final maxValue = controller.monthlyData
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
          width: 12.w,
          height: incomeHeight,
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(height: 2.h),
        // Expense bar
        Container(
          width: 12.w,
          height: expenseHeight,
          decoration: BoxDecoration(
            color: AppColors.error,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ),
        SizedBox(height: 8.h),
        // Month label
        Text(
          month,
          style: AppFonts.primaryRegular10.copyWith(
            color: AppColors.text1_600,
          ),
        ),
      ],
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
