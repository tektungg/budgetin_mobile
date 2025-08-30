import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/help/controllers/help_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class FAQCard extends GetView<HelpController> {
  const FAQCard({super.key});

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
          Text(
            'Frequently Asked Questions',
            style: AppFonts.primaryBold16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 8.h),
          Obx(() => Text(
                '${controller.filteredFAQ.length} of ${controller.faqData.length} questions',
                style: AppFonts.primaryRegular12.copyWith(
                  color: AppColors.text1_500,
                ),
              )),
          SizedBox(height: 16.h),
          Obx(() => controller.filteredFAQ.isEmpty
              ? _buildEmptyState()
              : _buildFAQList()),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 32.h),
      child: Column(
        children: [
          Icon(
            Icons.search_off,
            size: 48.w,
            color: AppColors.text1_300,
          ),
          SizedBox(height: 12.h),
          Text(
            'No results found',
            style: AppFonts.primaryMedium16.copyWith(
              color: AppColors.text1_500,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            'Try using different keywords',
            style: AppFonts.primaryRegular12.copyWith(
              color: AppColors.text1_400,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFAQList() {
    return Column(
      children:
          controller.filteredFAQ.map((faq) => _buildFAQItem(faq)).toList(),
    );
  }

  Widget _buildFAQItem(dynamic faq) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppColors.border,
          width: 1.w,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Theme(
        data: Theme.of(Get.context!).copyWith(
          dividerColor: Colors.transparent,
        ),
        child: ExpansionTile(
          tilePadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
          childrenPadding: EdgeInsets.fromLTRB(16.w, 0, 16.w, 16.h),
          title: Text(
            faq.question,
            style: AppFonts.primaryMedium14.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          children: [
            Container(
              width: double.infinity,
              padding: EdgeInsets.only(top: 8.h),
              child: Text(
                faq.answer,
                style: AppFonts.primaryRegular14.copyWith(
                  color: AppColors.text1_600,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
