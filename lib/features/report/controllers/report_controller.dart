import 'package:get/get.dart';

class ReportController extends GetxController {
  static ReportController get to => Get.find();

  // Observable variables
  final RxString _selectedPeriod = 'thisMonth'.obs;
  final RxString _selectedTab = 'overview'.obs;

  // Getters
  String get selectedPeriod => _selectedPeriod.value;
  String get selectedTab => _selectedTab.value;

  // Period options
  List<Map<String, String>> get periods => [
        {'value': 'thisWeek', 'label': 'This Week'},
        {'value': 'thisMonth', 'label': 'This Month'},
        {'value': 'last3Months', 'label': 'Last 3 Months'},
        {'value': 'thisYear', 'label': 'This Year'},
      ];

  // Mock data for different periods
  final Map<String, List<Map<String, dynamic>>> _periodData = {
    'thisWeek': [
      {'period': 'Mon', 'income': 300000, 'expense': 250000},
      {'period': 'Tue', 'income': 150000, 'expense': 200000},
      {'period': 'Wed', 'income': 200000, 'expense': 180000},
      {'period': 'Thu', 'income': 350000, 'expense': 300000},
      {'period': 'Fri', 'income': 400000, 'expense': 350000},
      {'period': 'Sat', 'income': 250000, 'expense': 220000},
      {'period': 'Sun', 'income': 180000, 'expense': 150000},
    ],
    'thisMonth': [
      {'period': 'Week 1', 'income': 800000, 'expense': 650000},
      {'period': 'Week 2', 'income': 950000, 'expense': 720000},
      {'period': 'Week 3', 'income': 750000, 'expense': 580000},
      {'period': 'Week 4', 'income': 1100000, 'expense': 850000},
    ],
    'last3Months': [
      {'period': 'Month 1', 'income': 3200000, 'expense': 2100000},
      {'period': 'Month 2', 'income': 2800000, 'expense': 1950000},
      {'period': 'Month 3', 'income': 3500000, 'expense': 2300000},
    ],
    'thisYear': [
      {'period': 'Q1', 'income': 8500000, 'expense': 6050000},
      {'period': 'Q2', 'income': 9400000, 'expense': 6950000},
      {'period': 'Q3', 'income': 8200000, 'expense': 6200000},
      {'period': 'Q4', 'income': 7800000, 'expense': 6100000},
    ],
  };

  final Map<String, List<Map<String, dynamic>>> _categoryDataByPeriod = {
    'thisWeek': [
      {'name': 'Food', 'value': 350000, 'color': 0xFFFF8042},
      {'name': 'Transportation', 'value': 200000, 'color': 0xFF00C49F},
      {'name': 'Shopping', 'value': 150000, 'color': 0xFFFFBB28},
      {'name': 'Entertainment', 'value': 100000, 'color': 0xFFFF6B9D},
      {'name': 'Bills', 'value': 250000, 'color': 0xFF8884D8},
      {'name': 'Others', 'value': 80000, 'color': 0xFF82CA9D},
    ],
    'thisMonth': [
      {'name': 'Food', 'value': 1200000, 'color': 0xFFFF8042},
      {'name': 'Transportation', 'value': 800000, 'color': 0xFF00C49F},
      {'name': 'Shopping', 'value': 600000, 'color': 0xFFFFBB28},
      {'name': 'Entertainment', 'value': 400000, 'color': 0xFFFF6B9D},
      {'name': 'Bills', 'value': 900000, 'color': 0xFF8884D8},
      {'name': 'Others', 'value': 300000, 'color': 0xFF82CA9D},
    ],
    'last3Months': [
      {'name': 'Food', 'value': 3600000, 'color': 0xFFFF8042},
      {'name': 'Transportation', 'value': 2400000, 'color': 0xFF00C49F},
      {'name': 'Shopping', 'value': 1800000, 'color': 0xFFFFBB28},
      {'name': 'Entertainment', 'value': 1200000, 'color': 0xFFFF6B9D},
      {'name': 'Bills', 'value': 2700000, 'color': 0xFF8884D8},
      {'name': 'Others', 'value': 900000, 'color': 0xFF82CA9D},
    ],
    'thisYear': [
      {'name': 'Food', 'value': 14400000, 'color': 0xFFFF8042},
      {'name': 'Transportation', 'value': 9600000, 'color': 0xFF00C49F},
      {'name': 'Shopping', 'value': 7200000, 'color': 0xFFFFBB28},
      {'name': 'Entertainment', 'value': 4800000, 'color': 0xFFFF6B9D},
      {'name': 'Bills', 'value': 10800000, 'color': 0xFF8884D8},
      {'name': 'Others', 'value': 3600000, 'color': 0xFF82CA9D},
    ],
  };

  final Map<String, List<Map<String, dynamic>>> _accountDataByPeriod = {
    'thisWeek': [
      {'name': 'Cash', 'balance': 750000, 'income': 150000, 'expense': 100000},
      {'name': 'BRI', 'balance': 1500000, 'income': 600000, 'expense': 400000},
      {'name': 'Gopay', 'balance': 500000, 'income': 200000, 'expense': 180000},
    ],
    'thisMonth': [
      {'name': 'Cash', 'balance': 750000, 'income': 500000, 'expense': 300000},
      {
        'name': 'BRI',
        'balance': 1500000,
        'income': 2000000,
        'expense': 1200000
      },
      {'name': 'Gopay', 'balance': 500000, 'income': 800000, 'expense': 600000},
    ],
    'last3Months': [
      {'name': 'Cash', 'balance': 850000, 'income': 1500000, 'expense': 900000},
      {
        'name': 'BRI',
        'balance': 1800000,
        'income': 6000000,
        'expense': 3600000
      },
      {
        'name': 'Gopay',
        'balance': 650000,
        'income': 2400000,
        'expense': 1800000
      },
    ],
    'thisYear': [
      {
        'name': 'Cash',
        'balance': 1000000,
        'income': 6000000,
        'expense': 3600000
      },
      {
        'name': 'BRI',
        'balance': 2200000,
        'income': 24000000,
        'expense': 14400000
      },
      {
        'name': 'Gopay',
        'balance': 800000,
        'income': 9600000,
        'expense': 7200000
      },
    ],
  };

  // Dynamic data getters based on selected period
  List<Map<String, dynamic>> get currentPeriodData {
    return _periodData[selectedPeriod] ?? _periodData['thisMonth']!;
  }

  List<Map<String, dynamic>> get categoryData {
    return _categoryDataByPeriod[selectedPeriod] ??
        _categoryDataByPeriod['thisMonth']!;
  }

  List<Map<String, dynamic>> get accountData {
    return _accountDataByPeriod[selectedPeriod] ??
        _accountDataByPeriod['thisMonth']!;
  }

  // Backward compatibility getters
  List<Map<String, dynamic>> get monthlyData => currentPeriodData;
  List<Map<String, dynamic>> get weeklyData => currentPeriodData;

  // Calculation methods
  double get totalIncome {
    return currentPeriodData.fold(0.0, (sum, data) => sum + data['income']);
  }

  double get totalExpense {
    return currentPeriodData.fold(0.0, (sum, data) => sum + data['expense']);
  }

  double get netIncome => totalIncome - totalExpense;

  double get expenseGrowth {
    if (currentPeriodData.length < 2) return 0.0;
    final currentPeriod = currentPeriodData.last['expense'];
    final previousPeriod =
        currentPeriodData[currentPeriodData.length - 2]['expense'];
    return ((currentPeriod - previousPeriod) / previousPeriod * 100);
  }

  // Actions
  void setSelectedPeriod(String period) {
    _selectedPeriod.value = period;
    // Trigger update for all reactive widgets
    update();
  }

  void setSelectedTab(String tab) {
    _selectedTab.value = tab;
  }

  void downloadReport() {
    Get.snackbar('Info', 'Download feature coming soon!');
  }

  String formatCurrency(double amount) {
    if (amount >= 1000000) {
      return 'Rp ${(amount / 1000000).toStringAsFixed(1)}M';
    } else if (amount >= 1000) {
      return 'Rp ${(amount / 1000).toStringAsFixed(0)}K';
    } else {
      return 'Rp ${amount.toStringAsFixed(0)}';
    }
  }
}
