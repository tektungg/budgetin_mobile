import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/report/controllers/report_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:fl_chart/fl_chart.dart';

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

          // fl_chart BarChart
          SizedBox(
            height: 300.h,
            child: BarChart(
              BarChartData(
                alignment: BarChartAlignment.spaceAround,
                maxY: _getMaxValue(),
                barTouchData: BarTouchData(enabled: false),
                titlesData: FlTitlesData(
                  show: true,
                  bottomTitles: AxisTitles(
                    sideTitles: SideTitles(
                      showTitles: true,
                      getTitlesWidget: (value, meta) {
                        if (value.toInt() >= 0 &&
                            value.toInt() < controller.monthlyData.length) {
                          return Padding(
                            padding: EdgeInsets.only(top: 8.h),
                            child: Text(
                              controller.monthlyData[value.toInt()]['month'],
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
                      interval: _getMaxValue() / 5,
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
                barGroups: _getBarGroups(),
                gridData: FlGridData(
                  show: true,
                  horizontalInterval: _getMaxValue() / 5,
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

  double _getMaxValue() {
    double maxValue = 0;
    for (var data in controller.monthlyData) {
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

  List<BarChartGroupData> _getBarGroups() {
    return controller.monthlyData.asMap().entries.map((entry) {
      final index = entry.key;
      final data = entry.value;
      return BarChartGroupData(
        x: index,
        barRods: [
          BarChartRodData(
            toY: data['income'].toDouble(),
            color: AppColors.accent,
            width: 12.w,
            borderRadius: BorderRadius.circular(2.r),
          ),
          BarChartRodData(
            toY: data['expense'].toDouble(),
            color: AppColors.error,
            width: 12.w,
            borderRadius: BorderRadius.circular(2.r),
          ),
        ],
        barsSpace: 4.w,
      );
    }).toList();
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
