import 'dart:developer';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:budgetin/configs/routes/route.dart';

class SimpleSupabaseService extends GetxService {
  static SimpleSupabaseService get instance =>
      Get.find<SimpleSupabaseService>();

  late SupabaseClient _client;
  SupabaseClient get client => _client;

  Future<SimpleSupabaseService> init() async {
    // Sudah di-initialize di main supabase service
    _client = Supabase.instance.client;
    return this;
  }

  // Auth helpers
  User? get currentUser => _client.auth.currentUser;
  bool get isLoggedIn => currentUser != null;
  Session? get currentSession => _client.auth.currentSession;

  // Simplified Google Sign In untuk testing
  Future<bool> signInWithGoogleSimple() async {
    try {
      log('Starting Google OAuth...', name: 'SimpleSupabaseService');

      // Gunakan OAuth flow sederhana
      final response = await _client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: null, // Biarkan default
      );

      log('OAuth response: $response', name: 'SimpleSupabaseService');
      return response;
    } catch (e) {
      log('Google Sign In Error: $e', name: 'SimpleSupabaseService');
      Get.snackbar(
        'Error',
        'Failed to sign in with Google: ${e.toString()}',
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }
  }

  // Simplified email sign in
  Future<AuthResponse?> signInSimple({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );
      return response;
    } catch (e) {
      log('Sign in error: $e', name: 'SimpleSupabaseService');
      Get.snackbar(
        'Error',
        'Failed to sign in: ${e.toString()}',
        snackPosition: SnackPosition.TOP,
      );
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _client.auth.signOut();
      Get.offAllNamed(Routes.signInRoute);
    } catch (e) {
      log('Sign out error: $e', name: 'SimpleSupabaseService');
    }
  }
}
