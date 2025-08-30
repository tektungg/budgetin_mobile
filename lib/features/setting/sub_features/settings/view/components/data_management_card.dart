import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/settings/controllers/settings_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class DataManagementCard extends GetView<SettingsController> {
  const DataManagementCard({super.key});

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
          Row(
            children: [
              Icon(
                Icons.storage,
                size: 16.w,
                color: AppColors.text1_1000,
              ),
              SizedBox(width: 8.w),
              Text(
                'Data Management',
                style: AppFonts.primaryBold16.copyWith(
                  color: AppColors.text1_1000,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Column(
            children: [
              _buildActionItem(
                title: 'Export Data',
                subtitle: 'Download your data in CSV format',
                icon: Icons.download,
                iconColor: AppColors.primary,
                onTap: () => controller.exportData(),
              ),
              SizedBox(height: 16.h),
              _buildActionItem(
                title: 'Import Data',
                subtitle: 'Import transactions from CSV file',
                icon: Icons.upload,
                iconColor: AppColors.primary,
                onTap: () => controller.importData(),
              ),
              SizedBox(height: 16.h),
              _buildActionItem(
                title: 'Backup Data',
                subtitle: 'Create a backup of your financial data',
                icon: Icons.backup,
                iconColor: AppColors.success,
                onTap: () => controller.backupData(),
              ),
              SizedBox(height: 16.h),
              _buildActionItem(
                title: 'Restore Data',
                subtitle: 'Restore data from a previous backup',
                icon: Icons.restore,
                iconColor: AppColors.warning,
                onTap: () => controller.restoreData(),
              ),
              SizedBox(height: 16.h),
              _buildActionItem(
                title: 'Clear All Data',
                subtitle: 'Permanently delete all your data',
                icon: Icons.delete_forever,
                iconColor: AppColors.error,
                onTap: () => controller.handleDeleteAllData(),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionItem({
    required String title,
    required String subtitle,
    required IconData icon,
    required Color iconColor,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: AppColors.background,
          borderRadius: BorderRadius.circular(8.r),
          border: Border.all(
            color: AppColors.border,
            width: 1.w,
          ),
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: iconColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(6.r),
              ),
              child: Icon(
                icon,
                size: 20.w,
                color: iconColor,
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppFonts.primaryMedium14.copyWith(
                      color: AppColors.text1_1000,
                    ),
                  ),
                  SizedBox(height: 2.h),
                  Text(
                    subtitle,
                    style: AppFonts.primaryRegular12.copyWith(
                      color: AppColors.text1_500,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              size: 16.w,
              color: AppColors.text1_500,
            ),
          ],
        ),
      ),
    );
  }
}
