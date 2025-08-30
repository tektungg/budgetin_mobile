import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/add_expense/controllers/add_expense_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class CategorySelectionCard extends GetView<AddExpenseController> {
  const CategorySelectionCard({super.key});

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
          // Header
          Row(
            children: [
              Icon(
                Icons.local_offer,
                size: 16.w,
                color: AppColors.text1_1000,
              ),
              SizedBox(width: 8.w),
              Text(
                'Kategori *',
                style: AppFonts.primaryBold16.copyWith(
                  color: AppColors.text1_1000,
                ),
              ),
            ],
          ),
          SizedBox(height: 20.h),

          // Category Grid
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12.w,
              mainAxisSpacing: 12.h,
              childAspectRatio: 0.85,
            ),
            itemCount: controller.categories.length,
            itemBuilder: (context, index) {
              final category = controller.categories[index];
              return Obx(() {
                final isSelected = controller.formData.category == category.id;

                return GestureDetector(
                  onTap: () {
                    controller.updateFormField('category', category.id);
                  },
                  child: Container(
                    padding: EdgeInsets.all(12.w),
                    decoration: BoxDecoration(
                      color: isSelected
                          ? AppColors.primary.withOpacity(0.1)
                          : AppColors.white,
                      borderRadius: BorderRadius.circular(12.r),
                      border: Border.all(
                        color:
                            isSelected ? AppColors.primary : AppColors.border,
                        width: isSelected ? 2 : 1,
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Icon Container
                        Container(
                          padding: EdgeInsets.all(8.w),
                          decoration: BoxDecoration(
                            color: category.color,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Icon(
                            category.icon,
                            size: 20.w,
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.text1_600,
                          ),
                        ),
                        SizedBox(height: 8.h),

                        // Category Name
                        Text(
                          category.name,
                          style: AppFonts.primarySemiBold12.copyWith(
                            color: isSelected
                                ? AppColors.primary
                                : AppColors.text1_700,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                );
              });
            },
          ),
        ],
      ),
    );
  }
}
