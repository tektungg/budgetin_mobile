import 'package:budgetin/configs/routes/route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/controllers/auth_controller.dart';

class SignUpController extends GetxController {
  static SignUpController get to => Get.find();

  late AuthController _authController;

  // Form controllers
  TextEditingController? _fullNameController;
  TextEditingController? _emailController;
  TextEditingController? _passwordController;
  TextEditingController? _confirmPasswordController;

  // Getters with null safety
  TextEditingController get fullNameController {
    _fullNameController ??= TextEditingController();
    return _fullNameController!;
  }

  TextEditingController get emailController {
    _emailController ??= TextEditingController();
    return _emailController!;
  }

  TextEditingController get passwordController {
    _passwordController ??= TextEditingController();
    return _passwordController!;
  }

  TextEditingController get confirmPasswordController {
    _confirmPasswordController ??= TextEditingController();
    return _confirmPasswordController!;
  }

  // Form key
  late GlobalKey<FormState> formKey;

  // Observable variables
  final RxBool _isPasswordVisible = false.obs;
  final RxBool _isConfirmPasswordVisible = false.obs;
  final RxBool _acceptTerms = false.obs;

  // Getters
  bool get isPasswordVisible => _isPasswordVisible.value;
  bool get isConfirmPasswordVisible => _isConfirmPasswordVisible.value;
  bool get acceptTerms => _acceptTerms.value;
  bool get isLoading => _authController.isLoading;
  String get errorMessage => _authController.errorMessage;

  @override
  void onInit() {
    super.onInit();
    _initControllers();
  }

  void _initControllers() {
    _authController = Get.find<AuthController>();
    _fullNameController = TextEditingController();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
    _confirmPasswordController = TextEditingController();
    formKey = GlobalKey<FormState>();
  }

  void clearError() {
    _authController.clearError();
  }

  void togglePasswordVisibility() {
    _isPasswordVisible.value = !_isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    _isConfirmPasswordVisible.value = !_isConfirmPasswordVisible.value;
  }

  void toggleAcceptTerms(bool? value) {
    _acceptTerms.value = value ?? false;
  }

  String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Full name is required';
    }
    if (value.trim().length < 2) {
      return 'Full name must be at least 2 characters';
    }
    return null;
  }

  String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required';
    }
    if (!GetUtils.isEmail(value.trim())) {
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

  String? validateConfirmPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirm password is required';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  Future<void> signUp() async {
    if (!formKey.currentState!.validate()) return;

    if (!acceptTerms) {
      _authController.setErrorMessage(
          'Anda harus menyetujui syarat dan ketentuan untuk melanjutkan pendaftaran.');
      return;
    }

    final success = await _authController.signUp(
      email: emailController.text.trim(),
      password: passwordController.text,
      fullName: fullNameController.text.trim(),
    );

    if (success) {
      // Clear form
      _clearForm();
      Get.offAllNamed(Routes.signInRoute);
    }
  }

  void _clearForm() {
    fullNameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    _acceptTerms.value = false;
  }

  void goToSignIn() {
    Get.back();
  }
}
