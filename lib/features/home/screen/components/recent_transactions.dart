import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budgetin/shared/styles/styles.dart';

class RecentTransactions extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;

  const RecentTransactions({
    super.key,
    this.transactions = const [
      {
        'title': 'Grocery Shopping',
        'date': '23 Agu 2025',
        'amount': 'Rp 150,000',
        'source': 'Cash',
        'isIncome': false,
      },
      {
        'title': 'Salary',
        'date': '22 Agu 2025',
        'amount': 'Rp 5,000,000',
        'source': 'Bank BRI',
        'isIncome': true,
      },
      {
        'title': 'Coffee Shop',
        'date': '22 Agu 2025',
        'amount': 'Rp 35,000',
        'source': 'E-Wallet',
        'isIncome': false,
      },
      {
        'title': 'Transfer to BNI',
        'date': '21 Agu 2025',
        'amount': 'Rp 1,000,000',
        'source': 'Bank Mandiri',
        'isIncome': false,
      },
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header outside container
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Recent Transactions',
                style: AppFonts.primarySemiBold18.copyWith(
                  color: AppColors.text1_1000,
                ),
              ),
              TextButton(
                onPressed: () {
                  // Navigate to all transactions
                },
                child: Text(
                  'See All',
                  style: AppFonts.primaryMedium14.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ),
        // Container with transactions only
        Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 24.w),
          padding: EdgeInsets.all(20.w),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Transactions List with Dividers
              ...transactions.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> transaction = entry.value;

                return Column(
                  children: [
                    _buildTransactionItem(
                      title: transaction['title'],
                      date: transaction['date'],
                      amount: transaction['amount'],
                      source: transaction['source'],
                      isIncome: transaction['isIncome'],
                    ),
                    if (index <
                        transactions.length -
                            1) // Add divider except for last item
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.h),
                        child: Divider(
                          color: AppColors.border,
                          thickness: 1,
                          height: 1,
                        ),
                      ),
                  ],
                );
              }),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildTransactionItem({
    required String title,
    required String date,
    required String amount,
    required String source,
    required bool isIncome,
  }) {
    final Color amountColor = isIncome ? AppColors.success : AppColors.error;
    final IconData icon = isIncome ? Icons.trending_up : Icons.trending_down;

    return Padding(
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

          // Transaction details (2 columns: title and date+source)
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
                // Date and source with bullet separator
                Row(
                  children: [
                    Text(
                      date,
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
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 2.h),
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

          // Amount (right side)
          Text(
            amount,
            style: AppFonts.primarySemiBold14.copyWith(
              color: amountColor,
            ),
          ),
        ],
      ),
    );
  }
}
