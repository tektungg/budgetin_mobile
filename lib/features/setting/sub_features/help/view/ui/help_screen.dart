import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/help/controllers/help_controller.dart';
import 'package:budgetin/features/setting/sub_features/help/view/components/help_search_bar.dart';
import 'package:budgetin/features/setting/sub_features/help/view/components/quick_help_card.dart';
import 'package:budgetin/features/setting/sub_features/help/view/components/faq_card.dart';
import 'package:budgetin/features/setting/sub_features/help/view/components/video_tutorials_card.dart';
import 'package:budgetin/features/setting/sub_features/help/view/components/tips_and_tricks_card.dart';
import 'package:budgetin/shared/styles/styles.dart';

class HelpScreen extends GetView<HelpController> {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          // Custom Header with Search
          Container(
            color: AppColors.primary,
            child: SafeArea(
              bottom: false,
              child: Column(
                children: [
                  // AppBar
                  Container(
                    padding: EdgeInsets.fromLTRB(16.w, 16.h, 16.w, 0),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => controller.navigateBack(),
                          child: Container(
                            padding: EdgeInsets.all(8.w),
                            decoration: BoxDecoration(
                              color: AppColors.white.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Icon(
                              Icons.arrow_back,
                              color: AppColors.white,
                              size: 20.w,
                            ),
                          ),
                        ),
                        SizedBox(width: 12.w),
                        Text(
                          'Help & FAQ',
                          style: AppFonts.primaryBold18.copyWith(
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 16.h),

                  // Search Bar
                  const HelpSearchBar(),

                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ),

          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(16.w),
              child: Column(
                children: [
                  const QuickHelpCard(),
                  SizedBox(height: 16.h),
                  const FAQCard(),
                  SizedBox(height: 16.h),
                  const VideoTutorialsCard(),
                  SizedBox(height: 16.h),
                  const TipsAndTricksCard(),
                  SizedBox(height: 24.h),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
