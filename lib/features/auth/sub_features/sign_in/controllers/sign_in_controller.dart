import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/controllers/auth_controller.dart';
import 'package:budgetin/configs/routes/route.dart';

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

  void clearError() {
    _authController.clearError();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
  }

  void toggleRememberMe(bool? value) {
    _rememberMe.value = value ?? false;
  }

  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) return;

    await _authController.signIn(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    // AuthStateService akan handle redirect, jadi tidak perlu manual redirect
    // Error message sudah ditampilkan melalui UI error display
  }

  Future<void> signInWithGoogle() async {
    await _authController.signInWithGoogle();

    // AuthStateService akan handle redirect, jadi tidak perlu manual redirect
    // Error message sudah ditampilkan melalui UI error display
  }

  void goToSignUp() {
    Get.toNamed(Routes.signUpRoute);
  }

  void goToForgotPassword() {
    Get.toNamed(Routes.forgotPasswordRoute);
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
