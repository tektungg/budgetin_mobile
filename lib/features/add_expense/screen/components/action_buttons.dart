import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/add_expense/controllers/add_expense_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class ActionButtons extends GetView<AddExpenseController> {
  const ActionButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      child: Row(
        children: [
          // Cancel Button
          Expanded(
            child: OutlinedButton(
              onPressed: controller.cancel,
              style: OutlinedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 16.h),
                side: BorderSide(color: AppColors.border),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.r),
                ),
              ),
              child: Text(
                'Batal',
                style: AppFonts.primarySemiBold16.copyWith(
                  color: AppColors.text1_600,
                ),
              ),
            ),
          ),

          SizedBox(width: 12.w),

          // Save Button
          Expanded(
            flex: 2,
            child: Obx(() {
              return ElevatedButton(
                onPressed: controller.isLoading ? null : controller.saveExpense,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: AppColors.white,
                  padding: EdgeInsets.symmetric(vertical: 16.h),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.r),
                  ),
                  elevation: 0,
                ),
                child: controller.isLoading
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 16.w,
                            height: 16.w,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.white,
                              ),
                            ),
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Menyimpan...',
                            style: AppFonts.primarySemiBold16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      )
                    : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.save,
                            size: 18.w,
                            color: AppColors.white,
                          ),
                          SizedBox(width: 8.w),
                          Text(
                            'Simpan Pengeluaran',
                            style: AppFonts.primarySemiBold16.copyWith(
                              color: AppColors.white,
                            ),
                          ),
                        ],
                      ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
