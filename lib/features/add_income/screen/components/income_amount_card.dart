import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/add_income/controllers/add_income_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class IncomeAmountCard extends GetView<AddIncomeController> {
  const IncomeAmountCard({super.key});

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
                Icons.calculate,
                size: 16.w,
                color: AppColors.text1_1000,
              ),
              SizedBox(width: 8.w),
              Text(
                'Jumlah Pemasukan',
                style: AppFonts.primaryBold16.copyWith(
                  color: AppColors.text1_1000,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Amount Field
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Jumlah (Rp) *',
                style: AppFonts.primarySemiBold14.copyWith(
                  color: AppColors.text1_800,
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: controller.amountController,
                keyboardType: TextInputType.number,
                style: AppFonts.primaryRegular16,
                decoration: InputDecoration(
                  hintText: '0',
                  hintStyle: AppFonts.primaryRegular16.copyWith(
                    color: AppColors.text1_400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: AppColors.success, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
                onChanged: (value) {
                  controller.updateFormField('amount', value);
                },
              ),

              // Formatted currency display
              Obx(() {
                if (controller.formData.amount.isNotEmpty) {
                  final amount = double.tryParse(controller.formData.amount);
                  if (amount != null) {
                    return Padding(
                      padding: EdgeInsets.only(top: 8.h),
                      child: Text(
                        controller.formatCurrency(amount),
                        style: AppFonts.primaryRegular12.copyWith(
                          color: AppColors.text1_500,
                        ),
                      ),
                    );
                  }
                }
                return const SizedBox.shrink();
              }),
            ],
          ),

          SizedBox(height: 16.h),

          // Description Field
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Deskripsi *',
                style: AppFonts.primarySemiBold14.copyWith(
                  color: AppColors.text1_800,
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: controller.descriptionController,
                style: AppFonts.primaryRegular16,
                decoration: InputDecoration(
                  hintText: 'Contoh: Gaji bulanan, Freelance project, dll',
                  hintStyle: AppFonts.primaryRegular16.copyWith(
                    color: AppColors.text1_400,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: AppColors.border),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.r),
                    borderSide: BorderSide(color: AppColors.success, width: 2),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16.w,
                    vertical: 12.h,
                  ),
                ),
                onChanged: (value) {
                  controller.updateFormField('description', value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
