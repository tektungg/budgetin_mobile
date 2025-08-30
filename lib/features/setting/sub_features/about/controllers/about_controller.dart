import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:budgetin/features/setting/sub_features/about/models/about_model.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AboutController extends GetxController {
  static AboutController get to => Get.find();

  // App Info
  AppInfo get appInfo => const AppInfo(
        name: 'Budgetin',
        description: 'Simple and powerful personal finance management app',
        version: '1.0.0',
        releaseYear: '2024',
        rating: '4.8',
      );

  // App Mission
  String get mission =>
      'Budgetin is here to help everyone manage personal finances easily, securely, and effectively. '
      'We believe that everyone deserves to have full control over their finances without unnecessary complexity.';

  // Key Features
  List<Feature> get features => [
        const Feature(
          icon: Icons.security,
          title: 'Guaranteed Security',
          description: 'Your data is protected with bank-level encryption',
        ),
        const Feature(
          icon: Icons.account_balance_wallet,
          title: 'Multi-Account',
          description: 'Manage various financial accounts in one app',
        ),
        const Feature(
          icon: Icons.flash_on,
          title: 'Real-time Tracking',
          description: 'Monitor your finances in real-time and accurately',
        ),
      ];

  // Development Team
  List<TeamMember> get team => [
        const TeamMember(name: 'Development Team', role: 'Development Team'),
        const TeamMember(name: 'UI/UX Team', role: 'Design Team'),
        const TeamMember(name: 'Quality Assurance', role: 'Testing Team'),
        const TeamMember(name: 'Customer Support', role: 'Support Team'),
      ];

  // Acknowledgments
  List<String> get acknowledgments => [
        'Flutter & Dart Community',
        'GetX State Management',
        'Material Design Icons',
        'URL Launcher Package',
        'Screen Util Package',
      ];

  // Policy Links
  List<PolicyLink> get policyLinks => [
        const PolicyLink(title: 'Privacy Policy', url: '#'),
        const PolicyLink(title: 'Terms & Conditions', url: '#'),
        const PolicyLink(title: 'Open Source License', url: '#'),
      ];

  // Methods
  Future<void> rateApp() async {
    Get.snackbar(
      'Rate App',
      'Opening app store...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: AppColors.white,
    );
  }

  Future<void> openWebsite() async {
    const url = 'https://budgetin.app';
    try {
      final uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar(
          'Error',
          'Cannot open website',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.error,
          colorText: AppColors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to open website',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
    }
  }

  Future<void> openPolicyLink(PolicyLink policy) async {
    if (policy.url == '#') {
      Get.snackbar(
        policy.title,
        'Coming soon!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.info,
        colorText: AppColors.white,
      );
      return;
    }

    try {
      final uri = Uri.parse(policy.url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        Get.snackbar(
          'Error',
          'Cannot open ${policy.title}',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppColors.error,
          colorText: AppColors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        'Failed to open link',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
    }
  }

  void navigateBack() {
    Get.back();
  }
}
