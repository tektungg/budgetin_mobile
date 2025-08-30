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

  // Mock data - in real app this would come from API
  final RxList<Map<String, dynamic>> _monthlyData = <Map<String, dynamic>>[
    {'month': 'Jan', 'income': 2500000, 'expense': 1800000},
    {'month': 'Feb', 'income': 3200000, 'expense': 2100000},
    {'month': 'Mar', 'income': 2800000, 'expense': 1950000},
    {'month': 'Apr', 'income': 3500000, 'expense': 2300000},
    {'month': 'May', 'income': 3100000, 'expense': 2150000},
    {'month': 'Jun', 'income': 3800000, 'expense': 2500000},
  ].obs;

  List<Map<String, dynamic>> get monthlyData => _monthlyData;

  List<Map<String, dynamic>> get weeklyData => [
        {'week': 'Week 1', 'income': 800000, 'expense': 650000},
        {'week': 'Week 2', 'income': 950000, 'expense': 720000},
        {'week': 'Week 3', 'income': 750000, 'expense': 580000},
        {'week': 'Week 4', 'income': 1100000, 'expense': 850000},
      ];

  List<Map<String, dynamic>> get categoryData => [
        {'name': 'Food', 'value': 1200000, 'color': 0xFFFF8042},
        {'name': 'Transportation', 'value': 800000, 'color': 0xFF00C49F},
        {'name': 'Shopping', 'value': 600000, 'color': 0xFFFFBB28},
        {'name': 'Entertainment', 'value': 400000, 'color': 0xFFFF6B9D},
        {'name': 'Bills', 'value': 900000, 'color': 0xFF8884D8},
        {'name': 'Others', 'value': 300000, 'color': 0xFF82CA9D},
      ];

  List<Map<String, dynamic>> get accountData => [
        {
          'name': 'Cash',
          'balance': 750000,
          'income': 500000,
          'expense': 300000
        },
        {
          'name': 'BRI',
          'balance': 1500000,
          'income': 2000000,
          'expense': 1200000
        },
        {
          'name': 'Gopay',
          'balance': 500000,
          'income': 800000,
          'expense': 600000
        },
      ];

  // Calculation methods
  double get totalIncome {
    return _monthlyData.fold(0.0, (sum, month) => sum + month['income']);
  }

  double get totalExpense {
    return _monthlyData.fold(0.0, (sum, month) => sum + month['expense']);
  }

  double get netIncome => totalIncome - totalExpense;

  double get expenseGrowth {
    if (_monthlyData.length < 2) return 0.0;
    final currentMonth = _monthlyData.last['expense'];
    final previousMonth = _monthlyData[_monthlyData.length - 2]['expense'];
    return ((currentMonth - previousMonth) / previousMonth * 100);
  }

  // Actions
  void setSelectedPeriod(String period) {
    _selectedPeriod.value = period;
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
