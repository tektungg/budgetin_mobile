import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/transaction/controllers/transaction_controller.dart';
import 'package:budgetin/features/transaction/screen/components/transaction_search_bar.dart';

class TransactionSearchSection extends GetView<TransactionController> {
  const TransactionSearchSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 16.h),
        TransactionSearchBar(
          controller: controller.searchController,
          onChanged: controller.searchTransactions,
          onClear: controller.clearSearch,
          hintText: 'Search transactions...',
        ),
        SizedBox(height: 16.h),
      ],
    );
  }
}
