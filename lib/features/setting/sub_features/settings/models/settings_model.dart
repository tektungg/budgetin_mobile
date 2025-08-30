class Language {
  final String value;
  final String label;
  final String flag;

  const Language({
    required this.value,
    required this.label,
    required this.flag,
  });
}

class NotificationSettings {
  final bool transactions;
  final bool budgetAlerts;
  final bool monthlyReports;
  final bool promotions;

  const NotificationSettings({
    required this.transactions,
    required this.budgetAlerts,
    required this.monthlyReports,
    required this.promotions,
  });

  NotificationSettings copyWith({
    bool? transactions,
    bool? budgetAlerts,
    bool? monthlyReports,
    bool? promotions,
  }) {
    return NotificationSettings(
      transactions: transactions ?? this.transactions,
      budgetAlerts: budgetAlerts ?? this.budgetAlerts,
      monthlyReports: monthlyReports ?? this.monthlyReports,
      promotions: promotions ?? this.promotions,
    );
  }
}

class SecuritySettings {
  final bool biometric;
  final bool autoLock;
  final bool loginNotifications;

  const SecuritySettings({
    required this.biometric,
    required this.autoLock,
    required this.loginNotifications,
  });

  SecuritySettings copyWith({
    bool? biometric,
    bool? autoLock,
    bool? loginNotifications,
  }) {
    return SecuritySettings(
      biometric: biometric ?? this.biometric,
      autoLock: autoLock ?? this.autoLock,
      loginNotifications: loginNotifications ?? this.loginNotifications,
    );
  }
}

class AppearanceSettings {
  final bool darkMode;
  final bool autoDownload;

  const AppearanceSettings({
    required this.darkMode,
    required this.autoDownload,
  });

  AppearanceSettings copyWith({
    bool? darkMode,
    bool? autoDownload,
  }) {
    return AppearanceSettings(
      darkMode: darkMode ?? this.darkMode,
      autoDownload: autoDownload ?? this.autoDownload,
    );
  }
}
