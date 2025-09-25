import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/constants/hive_constant.dart';
import 'package:budgetin/features/auth/controllers/auth_controller.dart';
import 'package:budgetin/utils/services/hive_service.dart';
import 'package:budgetin/configs/routes/route.dart';

class SignInController extends GetxController {
  static SignInController get to => Get.find();

  late AuthController _authController;
  late HiveService _hiveService;

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
    _hiveService = Get.find<HiveService>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formKey = GlobalKey<FormState>();
    _loadRememberedCredentials();
  }

  void _loadRememberedCredentials() {
    final savedRememberMe =
        _hiveService.get<bool>(key: HiveConstant.rememberMe) ?? false;
    _rememberMe.value = savedRememberMe;

    if (savedRememberMe) {
      final savedEmail =
          _hiveService.get<String>(key: HiveConstant.rememberedEmail) ?? '';
      emailController.text = savedEmail;
    }
  }

  void _persistRememberMe(bool value) {
    _hiveService.set<bool>(key: HiveConstant.rememberMe, data: value);
    if (!value) {
      _hiveService.remove(key: HiveConstant.rememberedEmail);
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  void clearError() {
    _authController.clearError();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
  }

  void toggleRememberMe(bool? value) {
    final newValue = value ?? false;
    _rememberMe.value = newValue;
    _persistRememberMe(newValue);
  }

  Future<void> signIn() async {
    if (!formKey.currentState!.validate()) return;

    final success = await _authController.signIn(
      email: emailController.text.trim(),
      password: passwordController.text,
    );

    if (success && rememberMe) {
      _hiveService.set<String>(
        key: HiveConstant.rememberedEmail,
        data: emailController.text.trim(),
      );
    } else if (!rememberMe) {
      _hiveService.remove(key: HiveConstant.rememberedEmail);
    }

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
