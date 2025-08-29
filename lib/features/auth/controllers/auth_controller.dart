import 'package:get/get.dart';
import 'package:budgetin/utils/services/supabase_service.dart';
import 'package:budgetin/utils/functions/error_parser.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthController extends GetxController {
  static AuthController get to => Get.find();

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

      final response = await _supabaseService.signUp(
        email: email,
        password: password,
        data: fullName != null ? {'full_name': fullName} : null,
      );

      if (response.user != null) {
        // Show success message for sign up to inform user to check email
        Get.snackbar(
          'Berhasil',
          'Akun berhasil dibuat! Silakan cek email Anda untuk verifikasi.',
          snackPosition: SnackPosition.TOP,
          backgroundColor: AppColors.success,
          colorText: AppColors.white,
        );
        return true;
      }
      return false;
    } catch (e) {
      final userFriendlyMessage = ErrorParser.parseAuthError(e);
      _errorMessage.value = userFriendlyMessage;
      // Error message will be displayed in UI, no need for snackbar
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

      final response = await _supabaseService.signIn(
        email: email,
        password: password,
      );

      if (response.user != null) {
        // Success message will be handled by UI if needed
        return true;
      }
      return false;
    } catch (e) {
      final userFriendlyMessage = ErrorParser.parseAuthError(e);
      _errorMessage.value = userFriendlyMessage;
      // Error message will be displayed in UI, no need for snackbar
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  Future<bool> signInWithGoogle() async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      final success = await _supabaseService.signInWithGoogle();

      if (success) {
        // Success message will be handled by UI if needed
        return true;
      }
      return false;
    } catch (e) {
      final userFriendlyMessage = ErrorParser.parseAuthError(e);
      _errorMessage.value = userFriendlyMessage;
      // Error message will be displayed in UI, no need for snackbar
      return false;
    } finally {
      _isLoading.value = false;
    }
  }

  Future<void> signOut() async {
    try {
      _isLoading.value = true;
      await _supabaseService.signOut();
      // Success message will be handled by UI if needed
    } catch (e) {
      final userFriendlyMessage = ErrorParser.parseAuthError(e);
      _errorMessage.value = userFriendlyMessage;
      // Error message will be displayed in UI, no need for snackbar
    } finally {
      _isLoading.value = false;
    }
  }

  void clearError() {
    _errorMessage.value = '';
  }

  void setErrorMessage(String message) {
    _errorMessage.value = message;
  }

  Future<bool> resetPassword(String email) async {
    try {
      _isLoading.value = true;
      _errorMessage.value = '';

      await _supabaseService.resetPassword(email);
      return true;
    } catch (e) {
      final userFriendlyMessage = ErrorParser.parseAuthError(e);
      _errorMessage.value = userFriendlyMessage;
      return false;
    } finally {
      _isLoading.value = false;
    }
  }
}
