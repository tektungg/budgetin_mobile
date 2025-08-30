import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budgetin/shared/styles/styles.dart';

class MonthlySummary extends StatelessWidget {
  final String income;
  final String expense;

  const MonthlySummary({
    super.key,
    this.income = 'Rp 8,500,000',
    this.expense = 'Rp 3,250,000',
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Row(
        children: [
          Expanded(
            child: _buildMonthlyCard(
              'Income',
              income,
              AppColors.success,
              Icons.trending_up,
            ),
          ),
          SizedBox(width: 16.w),
          Expanded(
            child: _buildMonthlyCard(
              'Expense',
              expense,
              AppColors.error,
              Icons.trending_down,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMonthlyCard(
      String title, String amount, Color color, IconData icon) {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: color.withValues(alpha: 0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                icon,
                color: color,
                size: 20.w,
              ),
              SizedBox(width: 8.w),
              Text(
                title,
                style: AppFonts.primaryMedium14.copyWith(
                  color: color,
                ),
              ),
            ],
          ),
          SizedBox(height: 8.h),
          Text(
            amount,
            style: AppFonts.primaryBold16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'This month',
            style: AppFonts.primaryRegular12.copyWith(
              color: AppColors.text1_600,
            ),
          ),
        ],
      ),
    );
  }
}
