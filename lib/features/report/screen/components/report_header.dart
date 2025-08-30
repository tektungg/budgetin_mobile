import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/report/controllers/report_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class ReportHeader extends GetView<ReportController> {
  const ReportHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.h),
      child: Row(
        children: [
          // Period Selector
          Expanded(
            child: Container(
              height: 50.h,
              padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
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
              child: Obx(() => DropdownButton<String>(
                    value: controller.selectedPeriod,
                    onChanged: (String? newValue) {
                      if (newValue != null) {
                        controller.setSelectedPeriod(newValue);
                      }
                    },
                    style: AppFonts.primaryRegular14.copyWith(
                      color: AppColors.text1_1000,
                    ),
                    icon: Icon(
                      Icons.keyboard_arrow_down,
                      color: AppColors.text1_600,
                    ),
                    underline: Container(),
                    isExpanded: true,
                    items: controller.periods
                        .map<DropdownMenuItem<String>>((period) {
                      return DropdownMenuItem<String>(
                        value: period['value'],
                        child: Text(
                          period['label']!,
                          style: AppFonts.primaryRegular14.copyWith(
                            color: AppColors.text1_1000,
                          ),
                        ),
                      );
                    }).toList(),
                  )),
            ),
          ),

          SizedBox(width: 16.w),

          // Download Button
          Container(
            height: 50.h,
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
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
            child: IconButton(
              onPressed: controller.downloadReport,
              icon: Icon(
                Icons.download,
                color: AppColors.primary,
                size: 24.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
