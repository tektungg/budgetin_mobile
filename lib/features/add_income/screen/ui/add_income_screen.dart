import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/add_income/controllers/add_income_controller.dart';
import 'package:budgetin/features/add_income/screen/components/index.dart';
import 'package:budgetin/shared/components/custom_app_bar.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AddIncomeScreen extends GetView<AddIncomeController> {
  const AddIncomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Tambah Pemasukan",
        backgroundColor: AppColors.primary,
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
                  const IncomeAmountCard(),
                  SizedBox(height: 16.h),

                  // Category Selection Card
                  const IncomeCategorySelectionCard(),
                  SizedBox(height: 16.h),

                  // Account Selection Card
                  const IncomeAccountSelectionCard(),
                  SizedBox(height: 16.h),

                  // Additional Details Card
                  const IncomeAdditionalDetailsCard(),
                  SizedBox(height: 16.h),

                  // Action Buttons
                  const IncomeActionButtons(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
