import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/configs/routes/route.dart';

class CustomBottomNavBar extends StatelessWidget {
  final String currentRoute;

  const CustomBottomNavBar({
    super.key,
    required this.currentRoute,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      decoration: BoxDecoration(
        color: AppColors.white,
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 10.r,
            offset: Offset(0, -2.h),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(
            icon: Icons.home_outlined,
            activeIcon: Icons.home,
            label: 'Home',
            isActive: currentRoute == Routes.homeRoute,
            onTap: () => _navigateToHome(),
          ),
          _buildNavItem(
            icon: Icons.assessment_outlined,
            activeIcon: Icons.assessment,
            label: 'Report',
            isActive: currentRoute == Routes.reportRoute,
            onTap: () => _navigateToReport(),
          ),
          _buildNavItem(
            icon: Icons.settings_outlined,
            activeIcon: Icons.settings,
            label: 'Setting',
            isActive: currentRoute == Routes.settingRoute,
            onTap: () => _navigateToSetting(),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem({
    required IconData icon,
    required IconData activeIcon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8.h),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isActive ? activeIcon : icon,
              size: 24.w,
              color: isActive ? AppColors.primary : AppColors.text1_600,
            ),
            SizedBox(height: 4.h),
            Text(
              label,
              style: AppFonts.primaryRegular12.copyWith(
                color: isActive ? AppColors.primary : AppColors.text1_600,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToHome() {
    if (currentRoute != Routes.homeRoute) {
      Get.offAllNamed(Routes.homeRoute);
    }
  }

  void _navigateToReport() {
    if (currentRoute != Routes.reportRoute) {
      Get.offAllNamed(Routes.reportRoute);
    }
  }

  void _navigateToSetting() {
    if (currentRoute != Routes.settingRoute) {
      Get.offAllNamed(Routes.settingRoute);
    }
  }
}
