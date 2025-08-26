import 'package:get/get.dart';
import 'package:budgetin/utils/services/supabase_service.dart';
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

      final response = await _supabaseService.signUp(
        email: email,
        password: password,
        data: fullName != null ? {'full_name': fullName} : null,
      );

      if (response.user != null) {
        Get.snackbar(
          'Success',
          'Account created successfully! Please check your email for verification.',
          snackPosition: SnackPosition.TOP,
        );
        return true;
      }
      return false;
    } catch (e) {
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

      final response = await _supabaseService.signIn(
        email: email,
        password: password,
      );

      if (response.user != null) {
        Get.snackbar(
          'Success',
          'Welcome back!',
          snackPosition: SnackPosition.TOP,
        );
        return true;
      }
      return false;
    } catch (e) {
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

      final success = await _supabaseService.signInWithGoogle();

      if (success) {
        Get.snackbar(
          'Success',
          'Signed in with Google successfully!',
          snackPosition: SnackPosition.TOP,
        );
        return true;
      }
      return false;
    } catch (e) {
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
      await _supabaseService.signOut();
      Get.snackbar(
        'Success',
        'Signed out successfully!',
        snackPosition: SnackPosition.TOP,
      );
    } catch (e) {
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

  void clearError() {
    _errorMessage.value = '';
  }
}
