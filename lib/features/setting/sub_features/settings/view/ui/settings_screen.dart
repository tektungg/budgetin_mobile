import 'package:budgetin/features/setting/sub_features/settings/controllers/settings_controller.dart';
import 'package:budgetin/features/setting/sub_features/settings/view/components/language_settings_card.dart';
import 'package:budgetin/features/setting/sub_features/settings/view/components/notification_settings_card.dart';
import 'package:budgetin/features/setting/sub_features/settings/view/components/security_settings_card.dart';
import 'package:budgetin/features/setting/sub_features/settings/view/components/appearance_settings_card.dart';
import 'package:budgetin/features/setting/sub_features/settings/view/components/data_management_card.dart';
import 'package:budgetin/features/setting/sub_features/settings/view/components/app_info_card.dart';
import 'package:budgetin/shared/components/custom_app_bar.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsScreen extends GetView<SettingsController> {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: CustomAppBar(
        title: 'Settings',
        onLeadingPressed: () => Get.back(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.w),
        child: Column(
          children: [
            const LanguageSettingsCard(),
            SizedBox(height: 16.h),
            const NotificationSettingsCard(),
            SizedBox(height: 16.h),
            const SecuritySettingsCard(),
            SizedBox(height: 16.h),
            const AppearanceSettingsCard(),
            SizedBox(height: 16.h),
            const DataManagementCard(),
            SizedBox(height: 16.h),
            const AppInfoCard(),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
