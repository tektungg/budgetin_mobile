import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/report/controllers/report_controller.dart';
import 'package:budgetin/features/report/screen/components/index.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/shared/components/custom_app_bar.dart';
import 'package:budgetin/shared/components/custom_bottom_nav_bar.dart';
import 'package:budgetin/configs/routes/route.dart';

class ReportScreen extends GetView<ReportController> {
  const ReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Financial Report',
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  children: [
                    // Header
                    const ReportHeader(),
                    SizedBox(height: 12.h),
                    // Tab Selector
                    const ReportTabSelector(),
                    SizedBox(height: 24.h),
                    // Tab Content
                    Obx(() {
                      switch (controller.selectedTab) {
                        case 'overview':
                          return const OverviewTab();
                        case 'trends':
                          return const TrendsTab();
                        case 'categories':
                          return const CategoriesTab();
                        case 'accounts':
                          return const AccountsTab();
                        default:
                          return const OverviewTab();
                      }
                    }),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),

      // Bottom Navigation
      bottomNavigationBar: CustomBottomNavBar(
        currentRoute: Routes.reportRoute,
      ),
    );
  }
}
