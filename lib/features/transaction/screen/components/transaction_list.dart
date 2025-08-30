import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/features/transaction/screen/components/transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Map<String, dynamic>> transactions;
  final bool showDividers;
  final EdgeInsets? padding;
  final VoidCallback? onTransactionTap;

  const TransactionList({
    super.key,
    required this.transactions,
    this.showDividers = true,
    this.padding,
    this.onTransactionTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: padding ?? EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: transactions.isEmpty
            ? [
                Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 40.h),
                    child: Column(
                      children: [
                        Icon(
                          Icons.receipt_long_outlined,
                          size: 48.w,
                          color: AppColors.text1_400,
                        ),
                        SizedBox(height: 16.h),
                        Text(
                          'No transactions found',
                          style: AppFonts.primaryRegular14.copyWith(
                            color: AppColors.text1_600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ]
            : transactions.asMap().entries.map((entry) {
                int index = entry.key;
                Map<String, dynamic> transaction = entry.value;

                return Column(
                  children: [
                    TransactionItem(
                      title: transaction['title'],
                      category: transaction['category'],
                      date: transaction['date'],
                      amount: transaction['amount'],
                      source: transaction['source'],
                      isIncome: transaction['isIncome'],
                      onTap: onTransactionTap,
                    ),
                    if (showDividers && index < transactions.length - 1)
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
              }).toList(),
      ),
    );
  }
}
