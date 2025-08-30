import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/home/controllers/home_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class HomeHeader extends GetView<HomeController> {
  final String totalBalance;

  const HomeHeader({
    super.key,
    this.totalBalance = 'Rp 15,250,000',
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.22,
      child: Stack(
        children: [
          // Primary background container
          Container(
            height: MediaQuery.of(context).size.height * 0.15,
            decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12.r),
                bottomRight: Radius.circular(12.r),
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Header with greeting and logout
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Obx(() {
                        final user = controller.currentUser;
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Welcome,',
                              style: AppFonts.primaryRegular14.copyWith(
                                color: AppColors.white.withValues(alpha: 0.8),
                              ),
                            ),
                            SizedBox(height: 4.h),
                            Text(
                              user?.userMetadata?['full_name'] ?? 'User',
                              style: AppFonts.primaryBold18.copyWith(
                                color: AppColors.white,
                              ),
                            ),
                          ],
                        );
                      }),
                      IconButton(
                        onPressed: controller.logout,
                        icon: Icon(
                          Icons.logout,
                          color: AppColors.white,
                          size: 24.w,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          // Total Balance Card (Positioned to overlay)
          Positioned(
            top: MediaQuery.of(context).size.height * 0.09,
            left: 24.w,
            right: 24.w,
            child: Container(
              width: double.infinity,
              padding: EdgeInsets.all(20.w),
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
                  Text(
                    'Total Balance',
                    style: AppFonts.primaryRegular14.copyWith(
                      color: AppColors.text1_600,
                    ),
                  ),
                  SizedBox(height: 8.h),
                  Text(
                    totalBalance,
                    style: AppFonts.primaryBold28.copyWith(
                      color: AppColors.text1_1000,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
