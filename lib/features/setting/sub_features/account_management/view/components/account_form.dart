import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/account_management/controllers/account_management_controller.dart';
import 'package:budgetin/features/setting/sub_features/account_management/models/account_model.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AccountForm extends GetView<AccountManagementController> {
  final bool isEdit;

  const AccountForm({
    super.key,
    this.isEdit = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(24.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            isEdit ? 'Edit Account' : 'Add New Account',
            style: AppFonts.primaryBold18.copyWith(
              color: AppColors.text1_1000,
            ),
          ),

          SizedBox(height: 24.h),

          // Account Name Field
          _buildFormField(
            label: 'Account Name',
            controller: controller.nameController,
            hintText: 'e.g., BCA, OVO, Wallet',
          ),

          SizedBox(height: 16.h),

          // Account Type Field
          _buildAccountTypeField(),

          SizedBox(height: 16.h),

          // Initial Balance Field
          _buildFormField(
            label: 'Initial Balance',
            controller: controller.balanceController,
            hintText: '0',
            keyboardType: TextInputType.number,
          ),

          SizedBox(height: 24.h),

          // Action Buttons
          Row(
            children: [
              // Cancel Button
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    if (isEdit) {
                      controller.closeEditModal();
                    } else {
                      controller.closeAddModal();
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 14.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: AppColors.border,
                        width: 1.w,
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        style: AppFonts.primaryMedium14.copyWith(
                          color: AppColors.text1_1000,
                        ),
                      ),
                    ),
                  ),
                ),
              ),

              SizedBox(width: 12.w),

              // Save Button
              Expanded(
                child: Obx(() {
                  return GestureDetector(
                    onTap: controller.isLoading
                        ? null
                        : (isEdit
                            ? controller.handleUpdateAccount
                            : controller.handleAddAccount),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 14.h),
                      decoration: BoxDecoration(
                        color: controller.isLoading
                            ? AppColors.primary.withValues(alpha: 0.6)
                            : AppColors.primary,
                        borderRadius: BorderRadius.circular(8.r),
                      ),
                      child: Center(
                        child: controller.isLoading
                            ? SizedBox(
                                width: 20.w,
                                height: 20.w,
                                child: CircularProgressIndicator(
                                  strokeWidth: 2.w,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    AppColors.white,
                                  ),
                                ),
                              )
                            : Text(
                                isEdit ? 'Update' : 'Add',
                                style: AppFonts.primaryMedium14.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFormField({
    required String label,
    required TextEditingController controller,
    required String hintText,
    TextInputType? keyboardType,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFonts.primaryMedium14.copyWith(
            color: AppColors.text1_1000,
          ),
        ),
        SizedBox(height: 8.h),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: AppFonts.primaryRegular14.copyWith(
              color: AppColors.text1_500,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.border,
                width: 1.w,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.border,
                width: 1.w,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 1.w,
              ),
            ),
            contentPadding: EdgeInsets.symmetric(
              horizontal: 16.w,
              vertical: 12.h,
            ),
          ),
          style: AppFonts.primaryRegular14.copyWith(
            color: AppColors.text1_1000,
          ),
        ),
      ],
    );
  }

  Widget _buildAccountTypeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Account Type',
          style: AppFonts.primaryMedium14.copyWith(
            color: AppColors.text1_1000,
          ),
        ),
        SizedBox(height: 8.h),
        Obx(() {
          return Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 4.h),
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.border,
                width: 1.w,
              ),
              borderRadius: BorderRadius.circular(8.r),
            ),
            child: DropdownButton<String>(
              dropdownColor: AppColors.white,
              borderRadius: BorderRadius.circular(12.r),
              value: controller.selectedType.isEmpty
                  ? null
                  : controller.selectedType,
              hint: Text(
                'Select account type',
                style: AppFonts.primaryRegular14.copyWith(
                  color: AppColors.text1_500,
                ),
              ),
              isExpanded: true,
              underline: Container(),
              onChanged: (String? value) {
                if (value != null) {
                  controller.setSelectedType(value);
                }
              },
              items: controller.accountTypes
                  .map<DropdownMenuItem<String>>((AccountType type) {
                return DropdownMenuItem<String>(
                  value: type.value,
                  child: Row(
                    children: [
                      Icon(
                        type.icon,
                        size: 16.w,
                        color: type.color,
                      ),
                      SizedBox(width: 8.w),
                      Text(
                        type.label,
                        style: AppFonts.primaryRegular14.copyWith(
                          color: AppColors.text1_1000,
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          );
        }),
      ],
    );
  }
}
