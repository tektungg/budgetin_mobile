import 'package:budgetin/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/about/controllers/about_controller.dart';
import 'package:budgetin/features/setting/sub_features/about/view/components/app_info_card.dart';
import 'package:budgetin/features/setting/sub_features/about/view/components/mission_card.dart';
import 'package:budgetin/features/setting/sub_features/about/view/components/features_card.dart';
import 'package:budgetin/features/setting/sub_features/about/view/components/team_card.dart';
import 'package:budgetin/features/setting/sub_features/about/view/components/acknowledgments_card.dart';
import 'package:budgetin/features/setting/sub_features/about/view/components/policy_card.dart';
import 'package:budgetin/features/setting/sub_features/about/view/components/copyright_card.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AboutScreen extends GetView<AboutController> {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "About Budgetin",
        onLeadingPressed: () => Get.back(),
      ),
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.all(16.w),
        child: SafeArea(
          child: Column(
            children: [
              const AppInfoCard(),
              SizedBox(height: 16.h),
              const MissionCard(),
              SizedBox(height: 16.h),
              const FeaturesCard(),
              SizedBox(height: 16.h),
              const TeamCard(),
              SizedBox(height: 16.h),
              const AcknowledgmentsCard(),
              SizedBox(height: 16.h),
              const PolicyCard(),
              SizedBox(height: 16.h),
              const CopyrightCard(),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}
