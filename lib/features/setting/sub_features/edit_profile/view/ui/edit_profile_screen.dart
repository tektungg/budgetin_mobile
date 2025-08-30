import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/edit_profile/controllers/edit_profile_controller.dart';
import 'package:budgetin/features/setting/sub_features/edit_profile/view/components/index.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/shared/components/custom_app_bar.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Edit Profile',
        centerTitle: true,
        onLeadingPressed: controller.navigateBack,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              SizedBox(height: 24.h),

              // Avatar Section
              const AvatarSection(),

              SizedBox(height: 24.h),

              // Personal Information Form
              const PersonalInformationForm(),

              SizedBox(height: 24.h),

              // Security Section
              const SecuritySection(),

              SizedBox(height: 24.h),

              // Action Buttons
              const ActionButtons(),

              SizedBox(height: 40.h), // Bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
