import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:budgetin/features/setting/sub_features/settings/models/settings_model.dart';
import 'package:budgetin/shared/styles/styles.dart';

class SettingsController extends GetxController {
  static SettingsController get to => Get.find();

  // Observable variables
  final RxString _selectedLanguage = 'en'.obs;
  final Rx<NotificationSettings> _notificationSettings =
      const NotificationSettings(
    transactions: true,
    budgetAlerts: true,
    monthlyReports: false,
    promotions: false,
  ).obs;
  final Rx<SecuritySettings> _securitySettings = const SecuritySettings(
    biometric: false,
    autoLock: true,
    loginNotifications: true,
  ).obs;
  final Rx<AppearanceSettings> _appearanceSettings = const AppearanceSettings(
    darkMode: false,
    autoDownload: false,
  ).obs;

  // Getters
  String get selectedLanguage => _selectedLanguage.value;
  NotificationSettings get notificationSettings => _notificationSettings.value;
  SecuritySettings get securitySettings => _securitySettings.value;
  AppearanceSettings get appearanceSettings => _appearanceSettings.value;

  // Available languages
  List<Language> get languages => const [
        Language(value: 'id', label: 'Bahasa Indonesia', flag: '🇮🇩'),
        Language(value: 'en', label: 'English', flag: '🇺🇸'),
        Language(value: 'ms', label: 'Bahasa Melayu', flag: '🇲🇾'),
      ];

  // Language methods
  void setLanguage(String value) {
    _selectedLanguage.value = value;
    final selectedLang = languages.firstWhere((lang) => lang.value == value);

    Get.snackbar(
      'Success',
      'Language changed to ${selectedLang.label}',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: AppColors.white,
    );
  }

  Language? getCurrentLanguage() {
    try {
      return languages
          .firstWhere((lang) => lang.value == _selectedLanguage.value);
    } catch (e) {
      return languages.first;
    }
  }

  // Notification methods
  void toggleNotificationSetting(String key) {
    switch (key) {
      case 'transactions':
        _notificationSettings.value = _notificationSettings.value.copyWith(
          transactions: !_notificationSettings.value.transactions,
        );
        break;
      case 'budgetAlerts':
        _notificationSettings.value = _notificationSettings.value.copyWith(
          budgetAlerts: !_notificationSettings.value.budgetAlerts,
        );
        break;
      case 'monthlyReports':
        _notificationSettings.value = _notificationSettings.value.copyWith(
          monthlyReports: !_notificationSettings.value.monthlyReports,
        );
        break;
      case 'promotions':
        _notificationSettings.value = _notificationSettings.value.copyWith(
          promotions: !_notificationSettings.value.promotions,
        );
        break;
    }

    Get.snackbar(
      'Success',
      'Notification settings updated',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: AppColors.white,
    );
  }

  // Security methods
  void toggleSecuritySetting(String key) {
    switch (key) {
      case 'biometric':
        _securitySettings.value = _securitySettings.value.copyWith(
          biometric: !_securitySettings.value.biometric,
        );
        break;
      case 'autoLock':
        _securitySettings.value = _securitySettings.value.copyWith(
          autoLock: !_securitySettings.value.autoLock,
        );
        break;
      case 'loginNotifications':
        _securitySettings.value = _securitySettings.value.copyWith(
          loginNotifications: !_securitySettings.value.loginNotifications,
        );
        break;
    }

    Get.snackbar(
      'Success',
      'Security settings updated',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: AppColors.white,
    );
  }

  // Appearance methods
  void toggleAppearanceSetting(String key) {
    switch (key) {
      case 'darkMode':
        _appearanceSettings.value = _appearanceSettings.value.copyWith(
          darkMode: !_appearanceSettings.value.darkMode,
        );
        break;
      case 'autoDownload':
        _appearanceSettings.value = _appearanceSettings.value.copyWith(
          autoDownload: !_appearanceSettings.value.autoDownload,
        );
        break;
    }

    Get.snackbar(
      'Success',
      'Appearance settings updated',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: AppColors.white,
    );
  }

  // Data management methods
  void handleExportData() {
    Get.snackbar(
      'Info',
      'Data export feature will be available soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void handleClearCache() {
    Get.snackbar(
      'Success',
      'App cache cleared successfully',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: AppColors.white,
    );
  }

  void handleDeleteAllData() {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete All Data'),
        content: const Text(
          'Are you sure you want to delete all data? This action cannot be undone and will remove all your transactions, accounts, and settings.',
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Get.back();
              Get.snackbar(
                'Error',
                'Delete all data feature requires additional confirmation',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: AppColors.error,
                colorText: AppColors.white,
              );
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void navigateBack() {
    Get.back();
  }

  // Data management methods
  void exportData() {
    Get.snackbar(
      'Export',
      'Exporting data...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: AppColors.white,
    );
  }

  void importData() {
    Get.snackbar(
      'Import',
      'Import data feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.primary,
      colorText: AppColors.white,
    );
  }

  void backupData() {
    Get.snackbar(
      'Backup',
      'Creating backup...',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.success,
      colorText: AppColors.white,
    );
  }

  void restoreData() {
    Get.snackbar(
      'Restore',
      'Restore data feature coming soon',
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: AppColors.warning,
      colorText: AppColors.white,
    );
  }

  // App info methods
  void openPrivacyPolicy() {
    Get.snackbar(
      'Privacy Policy',
      'Opening privacy policy...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void openTermsOfService() {
    Get.snackbar(
      'Terms of Service',
      'Opening terms of service...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void contactSupport() {
    Get.snackbar(
      'Support',
      'Opening support contact...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void rateApp() {
    Get.snackbar(
      'Rate App',
      'Opening app store...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void checkForUpdates() {
    Get.snackbar(
      'Updates',
      'Checking for updates...',
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
