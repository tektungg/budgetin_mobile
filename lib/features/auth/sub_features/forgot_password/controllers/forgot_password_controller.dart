import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/controllers/auth_controller.dart';
import 'package:budgetin/utils/functions/error_parser.dart';
import 'package:budgetin/shared/styles/styles.dart';

class ForgotPasswordController extends GetxController {
  static ForgotPasswordController get to => Get.find();

  late AuthController _authController;

  // Form controllers
  late TextEditingController emailController;

  // Form key
  late GlobalKey<FormState> formKey;

  // Observable variables
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;
  final RxString _successMessage = ''.obs;

  // Getters
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;
  String get successMessage => _successMessage.value;

  @override
  void onInit() {
    super.onInit();
    _initControllers();
  }

  void _initControllers() {
    _authController = Get.find<AuthController>();
    emailController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void clearError() {
    _errorMessage.value = '';
    _successMessage.value = '';
  }

  Future<void> sendResetPasswordEmail() async {
    if (!formKey.currentState!.validate()) return;

    try {
      _isLoading.value = true;
      _errorMessage.value = '';
      _successMessage.value = '';

      final success = await _resetPassword(emailController.text.trim());

      if (success) {
        _successMessage.value =
            'Email reset password telah dikirim! Silakan cek email Anda.';

        // Show success snackbar
        Get.snackbar(
          'Berhasil',
          'Email reset password telah dikirim ke ${emailController.text.trim()}',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.success,
          colorText: AppColors.white,
          duration: const Duration(seconds: 2),
        );

        // Clear form after successful send
        emailController.clear();
      }
    } catch (e) {
      final userFriendlyMessage = ErrorParser.parseAuthError(e);
      _errorMessage.value = userFriendlyMessage;
    } finally {
      _isLoading.value = false;
    }
  }

  Future<bool> _resetPassword(String email) async {
    try {
      return await _authController.resetPassword(email);
    } catch (e) {
      rethrow;
    }
  }

  void goBack() {
    Get.back();
  }

  // Validation methods
  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value)) {
      return 'Please enter a valid email';
    }
    return null;
  }
}
