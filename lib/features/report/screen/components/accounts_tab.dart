import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/report/controllers/report_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:fl_chart/fl_chart.dart';

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

          // fl_chart BarChart
          SizedBox(
            height: 300.h,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: _getMaxAccountValue(),
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() >= 0 &&
                            value.toInt() < controller.accountData.length) {
                          return Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Text(
                              controller.accountData[value.toInt()]['name'],
                              style: AppFonts.primaryRegular10.copyWith(
                                color: AppColors.text1_600,
                              ),
                            ),
                          );
                        }
                        return const Text('');
                      },
                      reservedSize: 32.h,
                    ),
                  ),
                  leftTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      interval: _getMaxAccountValue() / 5,
                      getTitlesWidget: (value, meta) {
                        return Text(
                          _formatChartValue(value),
                          style: AppFonts.primaryRegular10.copyWith(
                            color: AppColors.text1_600,
                          ),
                        );
                      },
                      reservedSize: 40.w,
                    ),
                  ),
                  rightTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                  topTitles: const AxisTitles(
                    sideTitles: SideTitles(showTitles: false),
                  ),
                ),
                borderData: FlBorderData(show: false),
                barGroups: _getAccountBarGroups(),
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: _getMaxAccountValue() / 5,
                  getDrawingHorizontalLine: (value) {
                    return FlLine(
                      color: AppColors.border,
                      strokeWidth: 1,
                    );
                  },
                  drawVerticalLine: false,
                ),
              ),
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

  double _getMaxAccountValue() {
    double maxValue = 0;
    for (var data in controller.accountData) {
      if (data['income'] > maxValue) maxValue = data['income'].toDouble();
      if (data['expense'] > maxValue) maxValue = data['expense'].toDouble();
    }
    return maxValue * 1.1; // Add 10% padding
  }

  String _formatChartValue(double value) {
    if (value >= 1000000) {
      return '${(value / 1000000).toStringAsFixed(0)}M';
    } else if (value >= 1000) {
      return '${(value / 1000).toStringAsFixed(0)}K';
    } else {
      return value.toStringAsFixed(0);
    }
  }

  List<BarChartGroupData> _getAccountBarGroups() {
    return controller.accountData.asMap().entries.map((entry) {
      final index = entry.key;
      final data = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: data['income'].toDouble(),
            color: AppColors.accent,
            width: 20.w,
            borderRadius: BorderRadius.circular(4.r),
          ),
          BarChartRodData(
            toY: data['expense'].toDouble(),
            color: AppColors.error,
            width: 20.w,
            borderRadius: BorderRadius.circular(4.r),
          ),
        ],
        barsSpace: 4.w,
      );
    }).toList();
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
