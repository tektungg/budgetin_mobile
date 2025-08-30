import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/add_expense/controllers/add_expense_controller.dart';
import 'package:budgetin/features/add_expense/screen/components/index.dart';
import 'package:budgetin/shared/components/custom_app_bar.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AddExpenseScreen extends GetView<AddExpenseController> {
  const AddExpenseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Tambah Pengeluaran",
        onLeadingPressed: () => Get.back(),
      ),
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  // Amount Card
                  const AmountCard(),
                  SizedBox(height: 16.h),

                  // Category Selection Card
                  const CategorySelectionCard(),
                  SizedBox(height: 16.h),

                  // Account Selection Card
                  const AccountSelectionCard(),
                  SizedBox(height: 16.h),

                  // Additional Details Card
                  const AdditionalDetailsCard(),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),

          // Action Buttons (Fixed at bottom)
          const ActionButtons(),
        ],
      ),
    );
  }
}
