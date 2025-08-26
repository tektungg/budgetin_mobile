import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:budgetin/env/env.dart';

class SupabaseService extends GetxService {
  static SupabaseService get instance => Get.find<SupabaseService>();

  late SupabaseClient _client;
  SupabaseClient get client => _client;

  Future<SupabaseService> init() async {
    await Supabase.initialize(
      url: Env.supabaseUrl,
      anonKey: Env.supabaseAnonKey,
    );

    _client = Supabase.instance.client;

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
      await _client.auth.signInWithOAuth(
        OAuthProvider.google,
        redirectTo: Env.supabaseGoogleCallbackUrl,
      );
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<void> signOut() async {
    await _client.auth.signOut();
  }

  // Stream untuk mendengar perubahan auth state
  Stream<AuthState> get authStateChanges => _client.auth.onAuthStateChange;
}
