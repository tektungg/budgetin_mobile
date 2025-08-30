import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/home/controllers/home_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/features/home/screen/components/index.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Header with total balance
            const HomeHeader(),

            // Main scrollable content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    // Spacing for header
                    SizedBox(height: 20.h),

                    // Account Balance
                    const AccountBalance(),

                    SizedBox(height: 24.h),

                    // Monthly Income/Expense
                    const MonthlySummary(),

                    SizedBox(height: 24.h),

                    // Recent Transactions
                    const RecentTransactions(),

                    SizedBox(height: 24.h),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
