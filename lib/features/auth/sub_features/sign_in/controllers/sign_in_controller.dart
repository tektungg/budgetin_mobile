import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/controllers/auth_controller.dart';

class SignInController extends GetxController {
  static SignInController get to => Get.find();

  late AuthController _authController;

  // Form controllers
  late TextEditingController emailController;
  late TextEditingController passwordController;

  // Form key
  late GlobalKey<FormState> formKey;

  // Observable variables
  final RxBool _isPasswordVisible = false.obs;
  final RxBool _rememberMe = false.obs;

  // Getters
  bool get isPasswordVisible => _isPasswordVisible.value;
  bool get rememberMe => _rememberMe.value;
  bool get isLoading => _authController.isLoading;
  String get errorMessage => _authController.errorMessage;

  @override
  void onInit() {
    super.onInit();
    _initControllers();
  }

  void _initControllers() {
    _authController = Get.find<AuthController>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
  }

  void toggleRememberMe(bool? value) {
    _rememberMe.value = value ?? false;
  }

  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) return;

    final success = await _authController.signIn(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    // AuthStateService akan handle redirect, jadi tidak perlu manual redirect
    if (!success) {
      Get.snackbar(
        'Error',
        'Failed to sign in. Please check your credentials.',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  Future<void> signInWithGoogle() async {
    final success = await _authController.signInWithGoogle();

    // AuthStateService akan handle redirect, jadi tidak perlu manual redirect
    if (!success) {
      Get.snackbar(
        'Error',
        'Failed to sign in with Google. Please try again.',
        snackPosition: SnackPosition.TOP,
      );
    }
  }

  void goToSignUp() {
    Get.toNamed('/sign-up');
  }

  void goToForgotPassword() {
    Get.toNamed('/forgot-password');
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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters';
    }
    return null;
  }
}
