import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/features/transaction/controllers/transaction_controller.dart';
import 'package:budgetin/features/transaction/screen/components/transaction_list.dart';

class TransactionListSection extends GetView<TransactionController> {
  const TransactionListSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Obx(() {
              if (controller.filteredTransactions.isEmpty) {
                return _buildEmptyState();
              }

              return TransactionList(
                transactions: controller.filteredTransactions,
                showDividers: true,
                onTransactionTap: () {
                  // Handle transaction tap - bisa navigate ke detail
                },
              );
            }),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      padding: EdgeInsets.symmetric(vertical: 80.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        children: [
          Icon(
            Icons.receipt_long_outlined,
            size: 64.w,
            color: AppColors.text1_400,
          ),
          SizedBox(height: 16.h),
          Text(
            'No transactions found',
            style: AppFonts.primaryRegular16.copyWith(
              color: AppColors.text1_600,
            ),
          ),
        ],
      ),
    );
  }
}
