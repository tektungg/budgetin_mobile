import 'package:get/get.dart';
import 'package:budgetin/utils/services/supabase_service.dart';
import 'package:budgetin/utils/services/app_logger.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  final SupabaseService _supabaseService = Get.find<SupabaseService>();

  // Observable variables
  final Rx<User?> _currentUser = Rx<User?>(null);
  final RxBool _isLoading = false.obs;
  final RxString _errorMessage = ''.obs;

  // Getters
  User? get currentUser => _currentUser.value;
  bool get isLoading => _isLoading.value;
  String get errorMessage => _errorMessage.value;
  bool get isLoggedIn => currentUser != null;

  @override
  void onInit() {
    super.onInit();
    _initAuthListener();
    _getCurrentUser();
  }

  void _initAuthListener() {
    _supabaseService.authStateChanges.listen((AuthState state) {
      _currentUser.value = state.session?.user;
    });
  }

  void _getCurrentUser() {
    _currentUser.value = _supabaseService.currentUser;
  }

  Future<bool> signUp({
    required String email,
    required String password,
    String? fullName,
  }) async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      AppLogger.logAuth(
        action: 'signUp',
        email: email,
      );

      final response = await _supabaseService.signUp(
        email: email,
        password: password,
        data: fullName != null ? {'full_name': fullName} : null,
      );

      if (response.user != null) {
        AppLogger.logAuth(
          action: 'signUp',
          email: email,
          userId: response.user?.id,
          success: true,
        );
        Get.snackbar(
          'Success',
          'Account created successfully! Please check your email for verification.',
          snackPosition: SnackPosition.TOP,
        );
        return true;
      }

      AppLogger.logAuth(
        action: 'signUp',
        email: email,
        success: false,
        error: 'response.user is null',
      );
      return false;
    } catch (e) {
      AppLogger.logAuth(
        action: 'signUp',
        email: email,
        success: false,
        error: e.toString(),
      );
      _errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  Future<bool> signIn({
    required String email,
    required String password,
  }) async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      AppLogger.logAuth(
        action: 'signIn',
        email: email,
      );

      final response = await _supabaseService.signIn(
        email: email,
        password: password,
      );

      if (response.user != null) {
        AppLogger.logAuth(
          action: 'signIn',
          email: email,
          userId: response.user?.id,
          success: true,
        );
        Get.snackbar(
          'Success',
          'Welcome back!',
          snackPosition: SnackPosition.TOP,
        );
        return true;
      }

      AppLogger.logAuth(
        action: 'signIn',
        email: email,
        success: false,
        error: 'response.user is null',
      );
      return false;
    } catch (e) {
      AppLogger.logAuth(
        action: 'signIn',
        email: email,
        success: false,
        error: e.toString(),
      );
      _errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      AppLogger.logAuth(action: 'signInWithGoogle');

      final success = await _supabaseService.signInWithGoogle();

      if (success) {
        AppLogger.logAuth(
          action: 'signInWithGoogle',
          success: true,
        );
        Get.snackbar(
          'Success',
          'Signed in with Google successfully!',
          snackPosition: SnackPosition.TOP,
        );
        return true;
      }

      AppLogger.logAuth(
        action: 'signInWithGoogle',
        success: false,
        error: 'Google sign in returned false',
      );
      return false;
    } catch (e) {
      AppLogger.logAuth(
        action: 'signInWithGoogle',
        success: false,
        error: e.toString(),
      );
      _errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      _isLoading.value = true;

      AppLogger.logAuth(action: 'signOut');

      await _supabaseService.signOut();

      AppLogger.logAuth(
        action: 'signOut',
        success: true,
      );
      Get.snackbar(
        'Success',
        'Signed out successfully!',
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
      AppLogger.logAuth(
        action: 'signOut',
        success: false,
        error: e.toString(),
      );
      _errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  Future<bool> resetPassword(String email) async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      AppLogger.logAuth(
        action: 'resetPassword',
        email: email,
      );

      await _supabaseService.resetPassword(email);

      AppLogger.logAuth(
        action: 'resetPassword',
        email: email,
        success: true,
      );
      Get.snackbar(
        'Success',
        'Reset password email sent successfully!',
        snackPosition: SnackPosition.TOP,
      );
      return true;
    } catch (e) {
      AppLogger.logAuth(
        action: 'resetPassword',
        email: email,
        success: false,
        error: e.toString(),
      );
      _errorMessage.value = e.toString();
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.TOP,
      );
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  void clearError() {
    _errorMessage.value = '';
  }
}
