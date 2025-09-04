import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/add_expense/controllers/add_expense_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/shared/widgets/custom_button.dart';

class ActionButtons extends GetView<AddExpenseController> {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          // Cancel Button
          Expanded(
            child: CustomButton(
              text: 'Batal',
              onPressed: controller.cancel,
              backgroundColor: AppColors.white,
              textColor: AppColors.text1_600,
              borderColor: AppColors.border,
              borderWidth: 1,
              borderRadius: 8.r,
              height: 52.h,
            ),
          ),

          SizedBox(width: 12.w),

          // Save Button
          Expanded(
            flex: 2,
            child: Obx(() {
              return CustomButton(
                text: controller.isLoading
                    ? 'Menyimpan...'
                    : 'Simpan Pengeluaran',
                onPressed: controller.isLoading ? null : controller.saveExpense,
                isLoading: controller.isLoading,
                backgroundColor: AppColors.primary,
                textColor: AppColors.white,
                borderRadius: 8.r,
                height: 52.h,
                icon: controller.isLoading
                    ? null
                    : Icon(
                        Icons.save,
                        size: 18.w,
                        color: AppColors.white,
                      ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
