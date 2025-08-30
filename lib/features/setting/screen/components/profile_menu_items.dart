import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/controllers/setting_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class ProfileMenuItems extends GetView<SettingController> {
  const ProfileMenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 10.r,
            offset: Offset(0, 4.h),
          ),
        ],
      ),
      child: Column(
        children: [
          ...controller.menuItems.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isLast = index == controller.menuItems.length - 1;

            return _buildMenuItem(
              item: item,
              showDivider: !isLast,
            );
          }),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required Map<String, dynamic> item,
    required bool showDivider,
  }) {
    return InkWell(
      onTap: item['action'],
      borderRadius: BorderRadius.circular(16.r),
      child: Container(
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          border: showDivider
              ? Border(
                  bottom: BorderSide(
                    color: AppColors.border,
                    width: 1,
                  ),
                )
              : null,
        ),
        child: Row(
          children: [
            // Icon
            Container(
              padding: EdgeInsets.all(8.w),
              decoration: BoxDecoration(
                color: AppColors.text1_100,
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: Icon(
                _getIconData(item['icon']),
                size: 20.w,
                color: AppColors.text1_600,
              ),
            ),

            SizedBox(width: 12.w),

            // Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item['title'],
                    style: AppFonts.primarySemiBold16.copyWith(
                      color: AppColors.text1_1000,
                    ),
                  ),
                  SizedBox(height: 4.h),
                  Text(
                    item['description'],
                    style: AppFonts.primaryRegular14.copyWith(
                      color: AppColors.text1_500,
                    ),
                  ),
                ],
              ),
            ),

            // Chevron
            Icon(
              Icons.chevron_right,
              size: 20.w,
              color: AppColors.text1_400,
            ),
          ],
        ),
      ),
    );
  }

  IconData _getIconData(String iconName) {
    switch (iconName) {
      case 'edit':
        return Icons.edit;
      case 'wallet':
        return Icons.account_balance_wallet;
      case 'settings':
        return Icons.settings;
      case 'help':
        return Icons.help_outline;
      case 'info':
        return Icons.info_outline;
      default:
        return Icons.circle;
    }
  }
}
