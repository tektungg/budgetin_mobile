import 'dart:developer';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:budgetin/env/env.dart';
import 'package:budgetin/utils/services/app_logger.dart';

class SupabaseService extends GetxService {
  static SupabaseService get instance => Get.find<SupabaseService>();

  late SupabaseClient _client;
  SupabaseClient get client => _client;

  // Google Sign In instance
  late GoogleSignIn _googleSignIn;

  Future<SupabaseService> init() async {
    await Supabase.initialize(
      url: Env.supabaseUrl,
      anonKey: Env.supabaseAnonKey,
    );

    _client = Supabase.instance.client;

    // Initialize Google Sign In
    _googleSignIn = GoogleSignIn(
        // Tambahkan server client ID jika diperlukan
        // serverClientId: 'your-server-client-id',
        );

    return this;
  }

  // Auth helpers
  User? get currentUser => _client.auth.currentUser;
  bool get isLoggedIn => currentUser != null;
  Session? get currentSession => _client.auth.currentSession;

  // Auth methods
  Future<AuthResponse> signUp({
    required String email,
    required String password,
    Map<String, dynamic>? data,
  }) async {
    AppLogger.logSupabaseRequest(
      operation: 'signUp',
      endpoint: 'auth.signUp',
      data: {'email': email, 'data': data},
    );

    try {
      final response = await _client.auth.signUp(
        email: email,
        password: password,
        data: data,
      );

      AppLogger.logSupabaseResponse(
        operation: 'signUp',
        success: true,
        data: {
          'userId': response.user?.id,
          'hasSession': response.session != null,
        },
      );

      return response;
    } catch (e) {
      AppLogger.logSupabaseResponse(
        operation: 'signUp',
        success: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    AppLogger.logSupabaseRequest(
      operation: 'signIn',
      endpoint: 'auth.signInWithPassword',
      data: {'email': email},
    );

    try {
      final response = await _client.auth.signInWithPassword(
        email: email,
        password: password,
      );

      AppLogger.logSupabaseResponse(
        operation: 'signIn',
        success: true,
        data: {
          'userId': response.user?.id,
          'hasSession': response.session != null,
        },
      );

      return response;
    } catch (e) {
      AppLogger.logSupabaseResponse(
        operation: 'signIn',
        success: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<bool> signInWithGoogle() async {
    AppLogger.logSupabaseRequest(
      operation: 'signInWithGoogle',
      endpoint: 'auth.signInWithOAuth',
      data: {'provider': 'google'},
    );

    try {
      log('Starting Google Sign In...', name: 'SupabaseService');

      // Method 1: Coba OAuth flow dulu (lebih reliable untuk mobile)
      log('📤 Supabase signInWithGoogle - Attempting OAuth flow',
          name: 'SupabaseService');
      final response = await _client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: null, // Biarkan Supabase handle redirect
      );

      log('OAuth response: $response', name: 'SupabaseService');
      AppLogger.logSupabaseResponse(
        operation: 'signInWithGoogle',
        success: true,
        data: {'method': 'OAuth', 'response': response},
      );
      return response;
    } catch (e) {
      log('OAuth Sign In Error: $e', name: 'SupabaseService');
      AppLogger.logError('OAuth Sign In failed, trying fallback', error: e);

      // Method 2: Fallback ke native Google Sign In
      try {
        log('Trying native Google Sign In fallback...',
            name: 'SupabaseService');
        AppLogger.logInfo('Attempting native Google Sign In fallback');

        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

        if (googleUser == null) {
          log('User cancelled Google Sign In', name: 'SupabaseService');
          AppLogger.logSupabaseResponse(
            operation: 'signInWithGoogle',
            success: false,
            error: 'User cancelled native sign in',
          );
          return false;
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final accessToken = googleAuth.accessToken;
        final idToken = googleAuth.idToken;

        if (accessToken == null) {
          AppLogger.logSupabaseResponse(
            operation: 'signInWithGoogle',
            success: false,
            error: 'No Access Token found',
          );
          throw 'No Access Token found.';
        }
        if (idToken == null) {
          AppLogger.logSupabaseResponse(
            operation: 'signInWithGoogle',
            success: false,
            error: 'No ID Token found',
          );
          throw 'No ID Token found.';
        }

        AppLogger.logInfo('Signing in with Google credentials via Supabase');
        // Sign in to Supabase with Google credentials
        final response = await _client.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
          accessToken: accessToken,
        );

        log('Native Google Sign In success: ${response.user?.email}',
            name: 'SupabaseService');
        AppLogger.logSupabaseResponse(
          operation: 'signInWithGoogle',
          success: true,
          data: {
            'method': 'native',
            'userId': response.user?.id,
            'email': response.user?.email,
          },
        );
        return response.user != null;
      } catch (e2) {
        log('Native Google Sign In fallback error: $e2',
            name: 'SupabaseService');
        AppLogger.logSupabaseResponse(
          operation: 'signInWithGoogle',
          success: false,
          error: 'Native fallback failed: $e2',
        );
        return false;
      }
    }
  }

  Future<void> signOut() async {
    AppLogger.logSupabaseRequest(
      operation: 'signOut',
      endpoint: 'auth.signOut',
    );

    try {
      await _client.auth.signOut();
      AppLogger.logSupabaseResponse(
        operation: 'signOut',
        success: true,
      );
    } catch (e) {
      AppLogger.logSupabaseResponse(
        operation: 'signOut',
        success: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  Future<void> resetPassword(String email) async {
    AppLogger.logSupabaseRequest(
      operation: 'resetPassword',
      endpoint: 'auth.resetPasswordForEmail',
      data: {'email': email},
    );

    try {
      await _client.auth.resetPasswordForEmail(email);
      AppLogger.logSupabaseResponse(
        operation: 'resetPassword',
        success: true,
        data: {'email': email},
      );
    } catch (e) {
      AppLogger.logSupabaseResponse(
        operation: 'resetPassword',
        success: false,
        error: e.toString(),
      );
      rethrow;
    }
  }

  // Stream untuk mendengar perubahan auth state
  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;
}
