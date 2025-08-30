import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/account_management/controllers/account_management_controller.dart';
import 'package:budgetin/features/setting/sub_features/account_management/models/account_model.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AccountsList extends GetView<AccountManagementController> {
  const AccountsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Text(
              'Account List',
              style: AppFonts.primaryBold16.copyWith(
                color: AppColors.text1_1000,
              ),
            ),
          ),
          Obx(() {
            if (controller.accounts.isEmpty) {
              return _buildEmptyState();
            }

            return Column(
              children: controller.accounts.asMap().entries.map((entry) {
                final index = entry.key;
                final account = entry.value;
                final isLast = index == controller.accounts.length - 1;

                return _buildAccountItem(account, !isLast);
              }).toList(),
            );
          }),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Padding(
      padding: EdgeInsets.all(40.w),
      child: Center(
        child: Column(
          children: [
            Icon(
              Icons.account_balance_wallet,
              size: 48.w,
              color: AppColors.text1_400,
            ),
            SizedBox(height: 12.h),
            Text(
              'No accounts yet',
              style: AppFonts.primaryMedium16.copyWith(
                color: AppColors.text1_600,
              ),
            ),
            SizedBox(height: 4.h),
            Text(
              'Add your first account to start managing your finances',
              style: AppFonts.primaryRegular12.copyWith(
                color: AppColors.text1_500,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountItem(Account account, bool showDivider) {
    final accountType = controller.getAccountType(account.type);

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          child: Row(
            children: [
              // Account Icon
              Container(
                padding: EdgeInsets.all(8.w),
                decoration: BoxDecoration(
                  color: account.color.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8.r),
                ),
                child: Icon(
                  account.icon,
                  size: 20.w,
                  color: account.color,
                ),
              ),

              SizedBox(width: 12.w),

              // Account Info
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      account.name,
                      style: AppFonts.primaryMedium14.copyWith(
                        color: AppColors.text1_1000,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      accountType?.label ?? account.type,
                      style: AppFonts.primaryRegular12.copyWith(
                        color: AppColors.text1_500,
                      ),
                    ),
                  ],
                ),
              ),

              // Balance
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    controller.formatCurrency(account.balance),
                    style: AppFonts.primaryBold14.copyWith(
                      color: AppColors.text1_1000,
                    ),
                  ),
                ],
              ),

              SizedBox(width: 12.w),

              // Action Buttons
              Row(
                children: [
                  GestureDetector(
                    onTap: () => controller.openEditModal(account),
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      child: Icon(
                        Icons.edit,
                        size: 16.w,
                        color: AppColors.text1_600,
                      ),
                    ),
                  ),
                  SizedBox(width: 4.w),
                  GestureDetector(
                    onTap: () => controller.handleDeleteAccount(account.id),
                    child: Container(
                      padding: EdgeInsets.all(8.w),
                      child: Icon(
                        Icons.delete,
                        size: 16.w,
                        color: AppColors.error,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        if (showDivider)
          Divider(
            height: 1.h,
            color: AppColors.border,
            indent: 20.w,
            endIndent: 20.w,
          ),
      ],
    );
  }
}
