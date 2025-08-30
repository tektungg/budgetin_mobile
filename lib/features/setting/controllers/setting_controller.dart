import 'package:get/get.dart';
import 'package:budgetin/shared/controllers/auth_controller.dart';
import 'package:budgetin/configs/routes/route.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingController extends GetxController {
  static SettingController get to => Get.find();

  late AuthController _authController;

  // Observable variables
  final RxString _activeTab = 'profile'.obs;

  // Getters
  User? get currentUser => _authController.currentUser;

  @override
  void onInit() {
    super.onInit();
    _authController = Get.find<AuthController>();
  }

  // Mock user data - in real app this would come from API
  Map<String, dynamic> get userData => {
        'name': currentUser?.userMetadata?['full_name'] ?? 'John Doe',
        'email': currentUser?.email ?? 'john.doe@example.com',
        'avatar': '', // Empty for fallback
        'joinDate': currentUser?.createdAt != null
            ? 'Joined since ${_formatJoinDate(DateTime.parse(currentUser!.createdAt))}'
            : '',
      };

  String _formatJoinDate(DateTime date) {
    // Format: Month Year (e.g., January 2024)
    final months = [
      'January',
      'February',
      'March',
      'April',
      'May',
      'June',
      'July',
      'August',
      'September',
      'October',
      'November',
      'December'
    ];
    final month = months[date.month - 1];
    final year = date.year;
    return '$month $year';
  }

  // Menu items for the profile
  List<Map<String, dynamic>> get menuItems => [
        {
          'id': 'edit-profile',
          'title': 'Edit Profile',
          'description': 'Update your personal information',
          'icon': 'edit',
          'action': () => navigateToEditProfile(),
        },
        {
          'id': 'account-management',
          'title': 'Account Management',
          'description': 'Add, edit, or delete financial accounts',
          'icon': 'wallet',
          'action': () => navigateToAccountManagement(),
        },
        {
          'id': 'settings',
          'title': 'Settings',
          'description': 'Language, notifications, and security',
          'icon': 'settings',
          'action': () => navigateToSettings(),
        },
        {
          'id': 'help',
          'title': 'Help & FAQ',
          'description': 'Get help and answers',
          'icon': 'help',
          'action': () => navigateToHelp(),
        },
        {
          'id': 'about',
          'title': 'About Budgetin',
          'description': 'App version and information',
          'icon': 'info',
          'action': () => navigateToAbout(),
        },
      ];

  // Navigation methods
  void setActiveTab(String tab) {
    _activeTab.value = tab;
  }

  void navigateToEditProfile() {
    // Navigate to edit profile screen
    Get.snackbar('Info', 'Edit Profile feature coming soon!');
  }

  void navigateToAccountManagement() {
    // Navigate to account management screen
    Get.snackbar('Info', 'Account Management feature coming soon!');
  }

  void navigateToSettings() {
    // Navigate to settings screen
    Get.snackbar('Info', 'Settings feature coming soon!');
  }

  void navigateToHelp() {
    // Navigate to help screen
    Get.snackbar('Info', 'Help & FAQ feature coming soon!');
  }

  void navigateToAbout() {
    // Navigate to about screen
    Get.snackbar('Info', 'About feature coming soon!');
  }

  void navigateToHome() {
    setActiveTab('home');
    Get.offAllNamed(Routes.homeRoute);
  }

  void navigateToReports() {
    setActiveTab('reports');
    // Navigate to reports screen
    Get.snackbar('Info', 'Reports feature coming soon!');
  }

  void logout() {
    _authController.signOut();
  }
}
