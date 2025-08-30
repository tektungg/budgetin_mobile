import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:budgetin/features/auth/controllers/auth_controller.dart';

class EditProfileController extends GetxController {
  static EditProfileController get to => Get.find();

  late AuthController _authController;

  // Observable form data
  final RxMap<String, dynamic> _formData = <String, dynamic>{
    'fullName': 'John Doe',
    'email': 'john.doe@example.com',
    'phone': '+62 812 3456 7890',
    'dateOfBirth': '1990-05-15',
    'address': 'Jakarta, Indonesia'
  }.obs;

  final RxString _avatar = ''.obs;
  final RxBool _isLoading = false.obs;

  // Getters
  Map<String, dynamic> get formData => _formData;
  String get avatar => _avatar.value;
  bool get isLoading => _isLoading.value;

  // Form controllers
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController dateOfBirthController = TextEditingController();
  final TextEditingController addressController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    _authController = Get.find<AuthController>();
    _initializeFormData();
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    dateOfBirthController.dispose();
    addressController.dispose();
    super.onClose();
  }

  void _initializeFormData() {
    // Initialize with current user data if available
    final currentUser = _authController.currentUser;
    if (currentUser != null) {
      _formData['fullName'] =
          currentUser.userMetadata?['full_name'] ?? 'John Doe';
      _formData['email'] = currentUser.email ?? 'john.doe@example.com';
    }

    // Set text controllers
    fullNameController.text = _formData['fullName'];
    emailController.text = _formData['email'];
    phoneController.text = _formData['phone'];
    dateOfBirthController.text = _formData['dateOfBirth'];
    addressController.text = _formData['address'];
  }

  void updateFormField(String field, String value) {
    _formData[field] = value;
  }

  void handleAvatarChange() {
    // Mock avatar change
    Get.snackbar(
      'Info',
      'Profile photo feature will be available soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void handleSaveProfile() {
    _isLoading.value = true;

    // Update form data from controllers
    _formData['fullName'] = fullNameController.text;
    _formData['email'] = emailController.text;
    _formData['phone'] = phoneController.text;
    _formData['dateOfBirth'] = dateOfBirthController.text;
    _formData['address'] = addressController.text;

    // Mock save profile
    Future.delayed(const Duration(seconds: 1), () {
      _isLoading.value = false;
      Get.snackbar(
        'Success',
        'Profile updated successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
      navigateBack();
    });
  }

  void handleChangePassword() {
    Get.snackbar(
      'Info',
      'Change password feature will be available soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void handleTwoFactorAuth() {
    Get.snackbar(
      'Info',
      '2FA feature will be available soon',
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void navigateBack() {
    Get.back();
  }

  String getInitials() {
    final name = _formData['fullName'] as String;
    return name.split(' ').map((n) => n[0]).join('').toUpperCase();
  }
}
