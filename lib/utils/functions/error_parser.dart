class ErrorParser {
  static String parseAuthError(dynamic error) {
    String errorString = error.toString();

    // Handle AuthApiException
    if (errorString.contains('AuthApiException')) {
      if (errorString.contains('invalid_credentials') ||
          errorString.contains('Invalid login credentials')) {
        return 'Email atau password yang Anda masukkan salah. Silakan coba lagi.';
      }
      if (errorString.contains('email_not_confirmed')) {
        return 'Email Anda belum dikonfirmasi. Silakan cek email Anda dan klik link konfirmasi.';
      }
      if (errorString.contains('signup_disabled')) {
        return 'Pendaftaran akun baru sedang tidak tersedia.';
      }
      if (errorString.contains('email_address_invalid')) {
        return 'Format email tidak valid. Silakan masukkan email yang benar.';
      }
      if (errorString.contains('password_too_short')) {
        return 'Password terlalu pendek. Minimal 6 karakter.';
      }
      if (errorString.contains('user_already_registered') ||
          errorString.contains('User already registered')) {
        return 'Email ini sudah terdaftar. Silakan gunakan email lain atau masuk dengan akun yang sudah ada.';
      }
      if (errorString.contains('weak_password')) {
        return 'Password terlalu lemah. Gunakan kombinasi huruf, angka, dan simbol.';
      }
      if (errorString.contains('rate_limit') ||
          errorString.contains('too_many_requests')) {
        return 'Terlalu banyak percobaan. Silakan tunggu beberapa saat dan coba lagi.';
      }
      if (errorString.contains('invalid_email')) {
        return 'Format email tidak valid. Silakan masukkan email yang benar.';
      }
      if (errorString.contains('email_taken')) {
        return 'Email ini sudah digunakan. Silakan gunakan email lain.';
      }
      if (errorString.contains('unable_to_validate_email')) {
        return 'Tidak dapat memvalidasi email. Silakan periksa email Anda.';
      }
      if (errorString.contains('email_not_found') ||
          errorString.contains('user_not_found')) {
        return 'Email tidak ditemukan. Pastikan email yang Anda masukkan benar.';
      }
      if (errorString.contains('password_reset_limit')) {
        return 'Terlalu banyak permintaan reset password. Silakan tunggu beberapa saat.';
      }
      if (errorString.contains('email_change_sent') ||
          errorString.contains('password_recovery_sent')) {
        return 'Email reset password sudah dikirim. Silakan cek email Anda.';
      }
    }

    //Handle AuthWeakPasswordException
    if (errorString.contains('AuthWeakPasswordException')) {
      return 'Password yang Anda masukkan terlalu lemah. Silakan gunakan kombinasi huruf besar, huruf kecil, dan angka';
    }

    // Handle network errors
    if (errorString.contains('network') ||
        errorString.contains('connection') ||
        errorString.contains('timeout') ||
        errorString.contains('SocketException')) {
      return 'Koneksi internet bermasalah. Silakan periksa koneksi Anda dan coba lagi.';
    }

    // Handle other common errors
    if (errorString.contains('server') || errorString.contains('500')) {
      return 'Terjadi masalah pada server. Silakan coba lagi nanti.';
    }

    if (errorString.contains('400') || errorString.contains('Bad Request')) {
      return 'Permintaan tidak valid. Silakan periksa data yang Anda masukkan.';
    }

    if (errorString.contains('401') || errorString.contains('Unauthorized')) {
      return 'Akses tidak diizinkan. Silakan login kembali.';
    }

    if (errorString.contains('403') || errorString.contains('Forbidden')) {
      return 'Akses ditolak. Anda tidak memiliki izin untuk melakukan tindakan ini.';
    }

    if (errorString.contains('404') || errorString.contains('Not Found')) {
      return 'Data yang Anda cari tidak ditemukan.';
    }

    // Default message for unknown errors
    return 'Terjadi kesalahan yang tidak diketahui. Silakan coba lagi.';
  }

  /// Parse general errors (can be extended for other types of errors)
  static String parseGeneralError(dynamic error) {
    return parseAuthError(error); // For now, use same logic
  }
}
