import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/add_expense/controllers/add_expense_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AccountSelectionCard extends GetView<AddExpenseController> {
  const AccountSelectionCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
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
          // Header
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet,
                size: 16.w,
                color: AppColors.text1_1000,
              ),
              SizedBox(width: 8.w),
              Text(
                'Dari Akun *',
                style: AppFonts.primaryBold16.copyWith(
                  color: AppColors.text1_1000,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Account Dropdown
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.border),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: Obx(() {
              return DropdownButton<String>(
                value: controller.formData.account.isNotEmpty
                    ? controller.formData.account
                    : null,
                hint: Text(
                  'Pilih akun sumber dana',
                  style: AppFonts.primaryRegular16.copyWith(
                    color: AppColors.text1_400,
                  ),
                ),
                isExpanded: true,
                underline: const SizedBox(),
                icon: Icon(
                  Icons.keyboard_arrow_down,
                  color: AppColors.text1_600,
                ),
                items: controller.accounts.map((account) {
                  return DropdownMenuItem<String>(
                    value: account.id,
                    child: Row(
                      children: [
                        Icon(
                          account.icon,
                          size: 20.w,
                          color: AppColors.text1_600,
                        ),
                        SizedBox(width: 12.w),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                account.name,
                                style: AppFonts.primarySemiBold14.copyWith(
                                  color: AppColors.text1_800,
                                ),
                              ),
                              Text(
                                '(${controller.formatCurrency(account.balance)})',
                                style: AppFonts.primaryRegular12.copyWith(
                                  color: AppColors.text1_500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.updateFormField('account', value);
                  }
                },
              );
            }),
          ),

          // Selected Account Balance Info
          Obx(() {
            final selectedAccount = controller.selectedAccount;
            if (selectedAccount != null) {
              final amount = double.tryParse(controller.formData.amount);
              final isInsufficientBalance =
                  amount != null && amount > selectedAccount.balance;

              return Padding(
                padding: EdgeInsets.only(top: 16.h),
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    color: isInsufficientBalance
                        ? AppColors.error.withValues(alpha: 0.1)
                        : AppColors.info.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(8.r),
                    border: Border.all(
                      color: isInsufficientBalance
                          ? AppColors.error.withValues(alpha: 0.3)
                          : AppColors.info.withValues(alpha: 0.3),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                selectedAccount.icon,
                                size: 16.w,
                                color: isInsufficientBalance
                                    ? AppColors.error
                                    : AppColors.info,
                              ),
                              SizedBox(width: 8.w),
                              Text(
                                'Saldo ${selectedAccount.name}',
                                style: AppFonts.primarySemiBold12.copyWith(
                                  color: isInsufficientBalance
                                      ? AppColors.error
                                      : AppColors.info,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            controller.formatCurrency(selectedAccount.balance),
                            style: AppFonts.primaryBold14.copyWith(
                              color: isInsufficientBalance
                                  ? AppColors.error
                                  : AppColors.info,
                            ),
                          ),
                        ],
                      ),

                      // Insufficient balance warning
                      if (isInsufficientBalance)
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Row(
                            children: [
                              Icon(
                                Icons.warning,
                                size: 14.w,
                                color: AppColors.error,
                              ),
                              SizedBox(width: 4.w),
                              Text(
                                'Saldo tidak mencukupi',
                                style: AppFonts.primaryRegular12.copyWith(
                                  color: AppColors.error,
                                ),
                              ),
                            ],
                          ),
                        ),

                      // Balance after expense
                      if (amount != null &&
                          amount > 0 &&
                          !isInsufficientBalance)
                        Padding(
                          padding: EdgeInsets.only(top: 8.h),
                          child: Container(
                            padding: EdgeInsets.only(top: 8.h),
                            decoration: BoxDecoration(
                              border: Border(
                                top: BorderSide(
                                  color: AppColors.info.withValues(alpha: 0.3),
                                  width: 1,
                                ),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Saldo setelah pengeluaran:',
                                  style: AppFonts.primaryRegular12.copyWith(
                                    color: AppColors.info,
                                  ),
                                ),
                                Text(
                                  controller.formatCurrency(
                                      controller.balanceAfterExpense),
                                  style: AppFonts.primaryBold14.copyWith(
                                    color: AppColors.info,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                    ],
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
