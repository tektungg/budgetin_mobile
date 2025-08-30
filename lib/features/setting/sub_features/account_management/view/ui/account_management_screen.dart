import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/account_management/controllers/account_management_controller.dart';
import 'package:budgetin/features/setting/sub_features/account_management/view/components/index.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/shared/components/custom_app_bar.dart';

class AccountManagementScreen extends GetView<AccountManagementController> {
  const AccountManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Account Management',
        centerTitle: true,
        onLeadingPressed: controller.navigateBack,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 16.w),
            child: GestureDetector(
              onTap: controller.openAddModal,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.circular(6.r),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.add,
                      size: 16.w,
                      color: AppColors.white,
                    ),
                    SizedBox(width: 4.w),
                    Text(
                      'Add',
                      style: AppFonts.primaryMedium12.copyWith(
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
      body: Stack(
        children: [
          // Main Content
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                children: [
                  SizedBox(height: 24.h),

                  // Total Balance Card
                  const TotalBalanceCard(),

                  SizedBox(height: 24.h),

                  // Accounts List
                  const AccountsList(),

                  SizedBox(height: 40.h), // Bottom spacing
                ],
              ),
            ),
          ),

          // Add Account Modal
          Obx(() {
            if (controller.isAddModalOpen) {
              return Container(
                color: AppColors.black.withValues(alpha: 0.5),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: const AccountForm(isEdit: false),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),

          // Edit Account Modal
          Obx(() {
            if (controller.isEditModalOpen) {
              return Container(
                color: AppColors.black.withValues(alpha: 0.5),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: const AccountForm(isEdit: true),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
