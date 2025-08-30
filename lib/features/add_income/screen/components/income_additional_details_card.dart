import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/add_income/controllers/add_income_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class IncomeAdditionalDetailsCard extends GetView<AddIncomeController> {
  const IncomeAdditionalDetailsCard({super.key});

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
                Icons.description,
                size: 16.w,
                color: AppColors.text1_1000,
              ),
              SizedBox(width: 8.w),
              Text(
                'Detail Tambahan',
                style: AppFonts.primaryBold16.copyWith(
                  color: AppColors.text1_1000,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Date Field
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tanggal',
                style: AppFonts.primarySemiBold14.copyWith(
                  color: AppColors.text1_800,
                ),
              ),
              SizedBox(height: 8.h),
              Obx(() {
                return GestureDetector(
                  onTap: () => _showDatePicker(context),
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 12.h,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.border),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.calendar_today,
                          size: 16.w,
                          color: AppColors.text1_600,
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          _formatDate(controller.formData.date),
                          style: AppFonts.primaryRegular16.copyWith(
                            color: AppColors.text1_800,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ],
          ),

          SizedBox(height: 16.h),

          // Notes Field
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Catatan (Opsional)',
                style: AppFonts.primarySemiBold14.copyWith(
                  color: AppColors.text1_800,
                ),
              ),
              SizedBox(height: 8.h),
              TextField(
                controller: controller.notesController,
                maxLines: 3,
                style: AppFonts.primaryRegular16,
                decoration: InputDecoration(
                  hintText: 'Tambahkan catatan atau keterangan tambahan...',
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
                  contentPadding: EdgeInsets.all(16.w),
                ),
                onChanged: (value) {
                  controller.updateFormField('notes', value);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showDatePicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: controller.formData.date,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.success,
              onPrimary: AppColors.white,
              surface: AppColors.white,
              onSurface: AppColors.text1_800,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != controller.formData.date) {
      controller.updateFormField('date', picked);
    }
  }

  String _formatDate(DateTime date) {
    final months = [
      '',
      'Januari',
      'Februari',
      'Maret',
      'April',
      'Mei',
      'Juni',
      'Juli',
      'Agustus',
      'September',
      'Oktober',
      'November',
      'Desember'
    ];

    return '${date.day} ${months[date.month]} ${date.year}';
  }
}
