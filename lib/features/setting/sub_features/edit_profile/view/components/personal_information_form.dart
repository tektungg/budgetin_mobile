import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/edit_profile/controllers/edit_profile_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class PersonalInformationForm extends GetView<EditProfileController> {
  const PersonalInformationForm({super.key});

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
            'Personal Information',
            style: AppFonts.primaryBold16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 20.h),

          // Full Name
          _buildFormField(
            label: 'Full Name',
            controller: controller.fullNameController,
            hintText: 'Enter your full name',
          ),

          SizedBox(height: 16.h),

          // Email
          _buildFormField(
            label: 'Email',
            controller: controller.emailController,
            hintText: 'Enter your email',
            keyboardType: TextInputType.emailAddress,
          ),

          SizedBox(height: 16.h),

          // Phone
          _buildFormField(
            label: 'Phone Number',
            controller: controller.phoneController,
            hintText: 'Enter your phone number',
            keyboardType: TextInputType.phone,
          ),

          SizedBox(height: 16.h),

          // Date of Birth
          _buildFormField(
            label: 'Date of Birth',
            controller: controller.dateOfBirthController,
            hintText: 'Select your date of birth',
            readOnly: true,
            onTap: () => _selectDate(context),
            suffixIcon: Icons.calendar_today,
          ),

          SizedBox(height: 16.h),

          // Address
          _buildFormField(
            label: 'Address',
            controller: controller.addressController,
            hintText: 'Enter your address',
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
    bool readOnly = false,
    VoidCallback? onTap,
    IconData? suffixIcon,
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
          readOnly: readOnly,
          onTap: onTap,
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
            suffixIcon: suffixIcon != null
                ? Icon(
                    suffixIcon,
                    color: AppColors.text1_600,
                    size: 20.w,
                  )
                : null,
          ),
          style: AppFonts.primaryRegular14.copyWith(
            color: AppColors.text1_1000,
          ),
        ),
      ],
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: AppColors.white,
              surface: AppColors.white,
              onSurface: AppColors.text1_1000,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      final formattedDate =
          '${picked.year}-${picked.month.toString().padLeft(2, '0')}-${picked.day.toString().padLeft(2, '0')}';
      controller.dateOfBirthController.text = formattedDate;
      controller.updateFormField('dateOfBirth', formattedDate);
    }
  }
}
