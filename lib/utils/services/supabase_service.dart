import 'dart:developer';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:budgetin/env/env.dart';

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
    return await _client.auth.signUp(
      email: email,
      password: password,
      data: data,
    );
  }

  Future<AuthResponse> signIn({
    required String email,
    required String password,
  }) async {
    return await _client.auth.signInWithPassword(
      email: email,
      password: password,
    );
  }

  Future<bool> signInWithGoogle() async {
    try {
      log('Starting Google Sign In...', name: 'SupabaseService');

      // Method 1: Coba OAuth flow dulu (lebih reliable untuk mobile)
      final response = await _client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: null, // Biarkan Supabase handle redirect
      );

      log('OAuth response: $response', name: 'SupabaseService');
      return response;
    } catch (e) {
      log('OAuth Sign In Error: $e', name: 'SupabaseService');

      // Method 2: Fallback ke native Google Sign In
      try {
        log('Trying native Google Sign In fallback...',
            name: 'SupabaseService');

        final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

        if (googleUser == null) {
          log('User cancelled Google Sign In', name: 'SupabaseService');
          return false;
        }

        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final accessToken = googleAuth.accessToken;
        final idToken = googleAuth.idToken;

        if (accessToken == null) {
          throw 'No Access Token found.';
        }
        if (idToken == null) {
          throw 'No ID Token found.';
        }

        // Sign in to Supabase with Google credentials
        final response = await _client.auth.signInWithIdToken(
          provider: OAuthProvider.google,
          idToken: idToken,
          accessToken: accessToken,
        );

        log('Native Google Sign In success: ${response.user?.email}',
            name: 'SupabaseService');
        return response.user != null;
      } catch (e2) {
        log('Native Google Sign In fallback error: $e2',
            name: 'SupabaseService');
        return false;
      }
    }
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  // Stream untuk mendengar perubahan auth state
  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;
}
