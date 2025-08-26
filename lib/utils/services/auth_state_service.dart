import 'dart:developer';

import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:budgetin/configs/routes/route.dart';
import 'package:budgetin/features/auth/controllers/auth_controller.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/controllers/sign_in_controller.dart';

class AuthStateService extends GetxService {
  static AuthStateService get instance => Get.find<AuthStateService>();

  Future<AuthStateService> init() async {
    // Listen to auth state changes
    Supabase.instance.client.auth.onAuthStateChange.listen((data) {
      final AuthState authState = data;
      _handleAuthStateChange(authState);
    });

    return this;
  }

  void _handleAuthStateChange(AuthState authState) {
    switch (authState.event) {
      case AuthChangeEvent.signedIn:
        log('User signed in: ${authState.session?.user.email}',
            name: 'AuthStateService');
        // Tambah delay untuk avoid double navigation
        Future.delayed(const Duration(milliseconds: 500), () {
          if (Get.currentRoute != Routes.homeRoute) {
            Get.offAllNamed(Routes.homeRoute);
          }
        });
        break;
      case AuthChangeEvent.signedOut:
        log('User signed out', name: 'AuthStateService');

        // Cleanup controllers before navigation
        _cleanupControllers();

        // Navigate to sign in screen
        Future.delayed(const Duration(milliseconds: 500), () {
          if (Get.currentRoute != Routes.signInRoute) {
            Get.offAllNamed(Routes.signInRoute);
          }
        });
        break;
      case AuthChangeEvent.tokenRefreshed:
        log('Token refreshed', name: 'AuthStateService');
        break;
      default:
        break;
    }
  }

  void _cleanupControllers() {
    try {
      // Cleanup auth-related controllers
      if (Get.isRegistered<SignInController>()) {
        Get.delete<SignInController>(force: true);
      }
      if (Get.isRegistered<AuthController>()) {
        Get.delete<AuthController>(force: true);
      }
    } catch (e) {
      log('Error cleaning up controllers: $e', name: 'AuthStateService');
    }
  }
}
