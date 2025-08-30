import 'package:budgetin/configs/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/features/transaction/screen/components/transaction_list.dart';
import 'package:budgetin/features/transaction/controllers/transaction_controller.dart';

class RecentTransactions extends GetView<TransactionController> {
  const RecentTransactions({super.key});

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
                  Get.toNamed(Routes.transactionRoute);
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
        // Transaction List (Recent only - 4 items)
        Obx(() => TransactionList(
              transactions: controller.recentTransactions,
              showDividers: true,
              onTransactionTap: () {
                // Navigate to transaction detail
                // Get.toNamed('/transaction');
              },
            )),
      ],
    );
  }
}
