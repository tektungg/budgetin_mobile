import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/report/controllers/report_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class TrendsTab extends GetView<ReportController> {
  const TrendsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Weekly Trend Chart
        _buildWeeklyTrendChart(),

        SizedBox(height: 20.h),

        // Growth Metrics
        _buildGrowthMetrics(),
      ],
    );
  }

  Widget _buildWeeklyTrendChart() {
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
            'Weekly Trends',
            style: AppFonts.primarySemiBold16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 16.h),

          // Simple line chart representation
          SizedBox(
            height: 200.h,
            child: CustomPaint(
              size: Size(double.infinity, 200.h),
              painter: LineChartPainter(controller.weeklyData),
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

  Widget _buildGrowthMetrics() {
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
            child: Row(
              children: [
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
                SizedBox(width: 12.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Income Growth',
                      style: AppFonts.primaryRegular12.copyWith(
                        color: AppColors.text1_600,
                      ),
                    ),
                    Text(
                      '+12.5%',
                      style: AppFonts.primaryBold14.copyWith(
                        color: AppColors.success,
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
            child: Row(
              children: [
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
                SizedBox(width: 12.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Expense Growth',
                        style: AppFonts.primaryRegular12.copyWith(
                          color: AppColors.text1_600,
                        ),
                      ),
                      Obx(() => Text(
                            '+${controller.expenseGrowth.toStringAsFixed(1)}%',
                            style: AppFonts.primaryBold14.copyWith(
                              color: AppColors.error,
                            ),
                          )),
                    ],
                  ),
                ),
              ],
            ),
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
          height: 2.h,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(1.r),
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

class LineChartPainter extends CustomPainter {
  final List<Map<String, dynamic>> data;

  LineChartPainter(this.data);

  @override
  void paint(Canvas canvas, Size size) {
    final padding = 20.0;
    final chartWidth = size.width - padding * 2;
    final chartHeight = size.height - padding * 2;

    // Find max value for scaling
    final maxValue = data
        .expand((item) => [item['income'], item['expense']])
        .reduce((a, b) => a > b ? a : b)
        .toDouble();

    // Draw income line
    final incomePaint = Paint()
      ..color = AppColors.accent
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final incomePoints = <Offset>[];
    for (int i = 0; i < data.length; i++) {
      final x = padding + (i / (data.length - 1)) * chartWidth;
      final y =
          padding + chartHeight - (data[i]['income'] / maxValue) * chartHeight;
      incomePoints.add(Offset(x, y));
    }

    if (incomePoints.length > 1) {
      final incomePath = Path();
      incomePath.moveTo(incomePoints.first.dx, incomePoints.first.dy);
      for (int i = 1; i < incomePoints.length; i++) {
        incomePath.lineTo(incomePoints[i].dx, incomePoints[i].dy);
      }
      canvas.drawPath(incomePath, incomePaint);
    }

    // Draw expense line
    final expensePaint = Paint()
      ..color = AppColors.error
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke;

    final expensePoints = <Offset>[];
    for (int i = 0; i < data.length; i++) {
      final x = padding + (i / (data.length - 1)) * chartWidth;
      final y =
          padding + chartHeight - (data[i]['expense'] / maxValue) * chartHeight;
      expensePoints.add(Offset(x, y));
    }

    if (expensePoints.length > 1) {
      final expensePath = Path();
      expensePath.moveTo(expensePoints.first.dx, expensePoints.first.dy);
      for (int i = 1; i < expensePoints.length; i++) {
        expensePath.lineTo(expensePoints[i].dx, expensePoints[i].dy);
      }
      canvas.drawPath(expensePath, expensePaint);
    }

    // Draw dots
    final dotPaint = Paint()..style = PaintingStyle.fill;

    for (final point in incomePoints) {
      dotPaint.color = AppColors.accent;
      canvas.drawCircle(point, 3, dotPaint);
    }

    for (final point in expensePoints) {
      dotPaint.color = AppColors.error;
      canvas.drawCircle(point, 3, dotPaint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
