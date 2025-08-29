import 'dart:developer';

/// A utility class for structured logging throughout the application
class AppLogger {
  /// Log a Supabase API request start
  static void logSupabaseRequest({
    required String operation,
    required String endpoint,
    Map<String, dynamic>? data,
  }) {
    log('🚀 Supabase API Request Started', name: 'Supabase');
    log('📋 Operation: $operation', name: 'Supabase');
    log('🔗 Endpoint: $endpoint', name: 'Supabase');
    if (data != null && data.isNotEmpty) {
      // Sanitize sensitive data
      final sanitizedData = _sanitizeData(data);
      log('📤 Request Data: $sanitizedData', name: 'Supabase');
    }
  }

  /// Log a Supabase API response
  static void logSupabaseResponse({
    required String operation,
    required bool success,
    Map<String, dynamic>? data,
    String? error,
  }) {
    if (success) {
      log('✅ Supabase API Success', name: 'Supabase');
      log('📋 Operation: $operation', name: 'Supabase');
      if (data != null && data.isNotEmpty) {
        final sanitizedData = _sanitizeData(data);
        log('📥 Response Data: $sanitizedData', name: 'Supabase');
      }
    } else {
      log('❌ Supabase API Error', name: 'Supabase');
      log('📋 Operation: $operation', name: 'Supabase');
      log('💥 Error: $error', name: 'Supabase');
    }
  }

  /// Log authentication events
  static void logAuth({
    required String action,
    String? email,
    String? userId,
    bool? success,
    String? error,
  }) {
    final icon = success == true
        ? '✅'
        : success == false
            ? '❌'
            : '🔐';
    log('$icon Auth Event: $action', name: 'Auth');
    if (email != null) log('👤 Email: $email', name: 'Auth');
    if (userId != null) log('🆔 User ID: $userId', name: 'Auth');
    if (error != null) log('💥 Error: $error', name: 'Auth');
  }

  /// Log general information
  static void logInfo(String message, {String? name}) {
    log('ℹ️ $message', name: name ?? 'App');
  }

  /// Log warnings
  static void logWarning(String message, {String? name}) {
    log('⚠️ $message', name: name ?? 'App');
  }

  /// Log errors
  static void logError(String message, {String? name, dynamic error}) {
    log('💥 $message', name: name ?? 'App');
    if (error != null) {
      log('📋 Error Details: $error', name: name ?? 'App');
    }
  }

  /// Log network requests
  static void logNetworkRequest({
    required String method,
    required String url,
    Map<String, dynamic>? headers,
    dynamic body,
  }) {
    log('🌐 Network Request: $method $url', name: 'Network');
    if (headers != null && headers.isNotEmpty) {
      final sanitizedHeaders = _sanitizeData(headers);
      log('📋 Headers: $sanitizedHeaders', name: 'Network');
    }
    if (body != null) {
      final sanitizedBody = _sanitizeData(body);
      log('📤 Body: $sanitizedBody', name: 'Network');
    }
  }

  /// Log network responses
  static void logNetworkResponse({
    required String method,
    required String url,
    required int statusCode,
    dynamic body,
    String? error,
  }) {
    final icon = statusCode >= 200 && statusCode < 300 ? '✅' : '❌';
    log('$icon Network Response: $method $url ($statusCode)', name: 'Network');
    if (body != null) {
      final sanitizedBody = _sanitizeData(body);
      log('📥 Response: $sanitizedBody', name: 'Network');
    }
    if (error != null) {
      log('💥 Error: $error', name: 'Network');
    }
  }

  /// Sanitize sensitive data for logging
  static dynamic _sanitizeData(dynamic data) {
    if (data is Map<String, dynamic>) {
      final sanitized = <String, dynamic>{};
      data.forEach((key, value) {
        if (_isSensitiveKey(key)) {
          sanitized[key] = '[REDACTED]';
        } else if (value is Map<String, dynamic>) {
          sanitized[key] = _sanitizeData(value);
        } else if (value is List) {
          sanitized[key] = value
              .map((item) =>
                  item is Map<String, dynamic> ? _sanitizeData(item) : item)
              .toList();
        } else {
          sanitized[key] = value;
        }
      });
      return sanitized;
    } else if (data is List) {
      return data
          .map((item) =>
              item is Map<String, dynamic> ? _sanitizeData(item) : item)
          .toList();
    }
    return data;
  }

  /// Check if a key contains sensitive information
  static bool _isSensitiveKey(String key) {
    final sensitiveKeys = [
      'password',
      'token',
      'secret',
      'key',
      'authorization',
      'auth',
      'credential',
      'private',
      'access_token',
      'refresh_token',
      'id_token',
      'session',
    ];

    return sensitiveKeys.any((sensitiveKey) =>
        key.toLowerCase().contains(sensitiveKey.toLowerCase()));
  }
}
