import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/report/controllers/report_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:fl_chart/fl_chart.dart';

class CategoriesTab extends GetView<ReportController> {
  const CategoriesTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Category Pie Chart
        _buildCategoryPieChart(),

        SizedBox(height: 20.h),

        // Category List
        _buildCategoryList(),

        SizedBox(height: 20.h),
      ],
    );
  }

  Widget _buildCategoryPieChart() {
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
            'Expense by Category',
            style: AppFonts.primarySemiBold16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 16.h),

          // fl_chart PieChart
          SizedBox(
            height: 200.h,
            child: PieChart(
              PieChartData(
                sectionsSpace: 2,
                centerSpaceRadius: 40.w,
                sections: _getPieSections(),
                borderData: FlBorderData(show: false),
                pieTouchData: PieTouchData(
                  touchCallback: (FlTouchEvent event, pieTouchResponse) {
                    // Handle touch events if needed
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> _getPieSections() {
    final total =
        controller.categoryData.fold(0.0, (sum, cat) => sum + cat['value']);

    return controller.categoryData.map((category) {
      final percentage = (category['value'] / total) * 100;
      return PieChartSectionData(
        color: Color(category['color']),
        value: category['value'].toDouble(),
        title: '${percentage.toStringAsFixed(1)}%',
        radius: 60.w,
        titleStyle: AppFonts.primarySemiBold12.copyWith(
          color: AppColors.white,
        ),
        titlePositionPercentageOffset: 0.6,
      );
    }).toList();
  }

  Widget _buildCategoryList() {
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
              'Category Details',
              style: AppFonts.primarySemiBold16.copyWith(
                color: AppColors.text1_1000,
              ),
            ),
          ),

          // Category items
          ...controller.categoryData.asMap().entries.map((entry) {
            final index = entry.key;
            final category = entry.value;
            final totalValue = controller.categoryData
                .fold(0.0, (sum, cat) => sum + cat['value']);
            final percentage =
                ((category['value'] / totalValue) * 100).toStringAsFixed(1);
            final isLast = index == controller.categoryData.length - 1;

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
              child: Row(
                children: [
                  // Color indicator
                  Container(
                    width: 16.w,
                    height: 16.h,
                    decoration: BoxDecoration(
                      color: Color(category['color']),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),

                  SizedBox(width: 12.w),

                  // Category info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          category['name'],
                          style: AppFonts.primarySemiBold14.copyWith(
                            color: AppColors.text1_1000,
                          ),
                        ),
                        SizedBox(height: 2.h),
                        Text(
                          '$percentage% of total',
                          style: AppFonts.primaryRegular12.copyWith(
                            color: AppColors.text1_500,
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Amount
                  Text(
                    controller.formatCurrency(category['value'].toDouble()),
                    style: AppFonts.primaryBold14.copyWith(
                      color: AppColors.text1_800,
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
