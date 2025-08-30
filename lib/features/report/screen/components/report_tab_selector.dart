import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/report/controllers/report_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class ReportTabSelector extends GetView<ReportController> {
  const ReportTabSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final tabs = [
      {'value': 'overview', 'label': 'Overview'},
      {'value': 'trends', 'label': 'Trends'},
      {'value': 'categories', 'label': 'Categories'},
      {'value': 'accounts', 'label': 'Accounts'},
    ];

    return Obx(() => Container(
          decoration: BoxDecoration(
            color: AppColors.text1_100,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Row(
            children: tabs.map((tab) {
              final isSelected = controller.selectedTab == tab['value'];
              return Expanded(
                child: GestureDetector(
                  onTap: () => controller.setSelectedTab(tab['value']!),
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: BoxDecoration(
                      color:
                          isSelected ? AppColors.primary : Colors.transparent,
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Text(
                      tab['label']!,
                      style: AppFonts.primarySemiBold14.copyWith(
                        color:
                            isSelected ? AppColors.white : AppColors.text1_600,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ));
  }
}
