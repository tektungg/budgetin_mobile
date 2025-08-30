import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budgetin/shared/styles/styles.dart';

class TransactionItem extends StatelessWidget {
  final String title;
  final String category;
  final String date;
  final String amount;
  final String source;
  final bool isIncome;
  final VoidCallback? onTap;

  const TransactionItem({
    super.key,
    required this.title,
    required this.category,
    required this.date,
    required this.amount,
    required this.source,
    required this.isIncome,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final Color amountColor = isIncome ? AppColors.success : AppColors.error;
    final IconData icon = isIncome ? Icons.trending_up : Icons.trending_down;

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12.r),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Row(
          children: [
            // Icon
            Container(
              width: 40.w,
              height: 40.h,
              decoration: BoxDecoration(
                color: isIncome
                    ? AppColors.success.withValues(alpha: 0.1)
                    : AppColors.error.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Icon(
                icon,
                color: amountColor,
                size: 20.w,
              ),
            ),
            SizedBox(width: 12.w),

            // Transaction details (title, category + source tag)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Text(
                    title,
                    style: AppFonts.primaryMedium14.copyWith(
                      color: AppColors.text1_1000,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  // Category and source tag
                  Row(
                    children: [
                      Text(
                        category,
                        style: AppFonts.primaryRegular12.copyWith(
                          color: AppColors.text1_600,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 6.w),
                        width: 4.w,
                        height: 4.h,
                        decoration: BoxDecoration(
                          color: AppColors.text1_600,
                          shape: BoxShape.circle,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 2.h),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Text(
                          source,
                          style: AppFonts.primaryMedium10.copyWith(
                            color: AppColors.primary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Amount and date (right column)
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                // Amount (top)
                Text(
                  amount,
                  style: AppFonts.primarySemiBold14.copyWith(
                    color: amountColor,
                  ),
                ),
                SizedBox(height: 4.h),
                // Date (bottom)
                Text(
                  date,
                  style: AppFonts.primaryRegular12.copyWith(
                    color: AppColors.text1_600,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
