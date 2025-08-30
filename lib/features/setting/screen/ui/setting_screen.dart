import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/controllers/setting_controller.dart';
import 'package:budgetin/features/setting/screen/components/index.dart';
import 'package:budgetin/shared/styles/styles.dart';

class SettingScreen extends GetView<SettingController> {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Scrollable Content
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(height: 24.h),

                    // User Profile Card
                    const UserProfileCard(),

                    SizedBox(height: 20.h),

                    // Menu Items
                    const ProfileMenuItems(),

                    SizedBox(height: 20.h),

                    // Logout Button
                    const LogoutButton(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
