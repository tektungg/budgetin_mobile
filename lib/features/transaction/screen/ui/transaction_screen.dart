import 'package:budgetin/features/transaction/controllers/transaction_controller.dart';
import 'package:budgetin/shared/components/custom_app_bar.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/features/transaction/screen/components/index.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class TransactionScreen extends GetView<TransactionController> {
  const TransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: CustomAppBar(
        title: 'All Transactions',
        automaticallyImplyLeading: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Search Section
            const TransactionSearchSection(),

            // Transaction List Section
            const TransactionListSection(),
          ],
        ),
      ),
    );
  }
}
