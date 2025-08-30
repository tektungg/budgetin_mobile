// ignore_for_file: strict_top_level_inference

import 'package:get/get.dart';
import 'package:budgetin/features/auth/controllers/auth_controller.dart';

class HomeController extends GetxController {
  static HomeController get to => Get.find();

  late AuthController _authController;

  @override
  void onInit() {
    super.onInit();
    _authController = Get.find<AuthController>();
  }

  // Getter for current user
  get currentUser => _authController.currentUser;

  // Quick action methods
  void addIncome() {
    Get.snackbar('Feature', 'Add Income feature coming soon!');
  }

  void addExpense() {
    Get.snackbar('Feature', 'Add Expense feature coming soon!');
  }

  void viewReports() {
    Get.snackbar('Feature', 'Reports feature coming soon!');
  }

  void openSettings() {
    Get.snackbar('Feature', 'Settings feature coming soon!');
  }

  void logout() {
    _authController.signOut();
  }

  void navigateToAddIncome() {
  }

  void navigateToAddExpense() {
  }
}
