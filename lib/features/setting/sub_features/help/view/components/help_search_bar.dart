import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/help/controllers/help_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class HelpSearchBar extends GetView<HelpController> {
  const HelpSearchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.w),
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
      child: TextField(
        onChanged: (value) => controller.updateSearchQuery(value),
        decoration: InputDecoration(
          hintText: 'Search questions or help topics...',
          hintStyle: AppFonts.primaryRegular14.copyWith(
            color: AppColors.text1_500,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: AppColors.text1_500,
            size: 20.w,
          ),
          suffixIcon: Obx(() => controller.searchQuery.isNotEmpty
              ? GestureDetector(
                  onTap: () => controller.clearSearch(),
                  child: Icon(
                    Icons.clear,
                    color: AppColors.text1_500,
                    size: 20.w,
                  ),
                )
              : const SizedBox.shrink()),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.r),
            borderSide: BorderSide.none,
          ),
          filled: true,
          fillColor: AppColors.white,
          contentPadding: EdgeInsets.symmetric(
            horizontal: 16.w,
            vertical: 12.h,
          ),
        ),
        style: AppFonts.primaryRegular14.copyWith(
          color: AppColors.text1_1000,
        ),
      ),
    );
  }
}
