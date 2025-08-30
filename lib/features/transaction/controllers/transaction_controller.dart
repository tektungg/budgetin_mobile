import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TransactionController extends GetxController {
  static TransactionController get to => Get.find();

  final TextEditingController searchController = TextEditingController();

  // Observable list untuk semua transaksi
  final RxList<Map<String, dynamic>> _allTransactions = <Map<String, dynamic>>[
    {
      'title': 'Grocery Shopping',
      'category': 'Food & Dining',
      'date': '23 Agu 2025',
      'amount': 'Rp 150,000',
      'source': 'Cash',
      'isIncome': false,
    },
    {
      'title': 'Salary',
      'category': 'Income',
      'date': '22 Agu 2025',
      'amount': 'Rp 5,000,000',
      'source': 'Bank BRI',
      'isIncome': true,
    },
    {
      'title': 'Coffee Shop',
      'category': 'Food & Dining',
      'date': '22 Agu 2025',
      'amount': 'Rp 35,000',
      'source': 'E-Wallet',
      'isIncome': false,
    },
    {
      'title': 'Transfer to BNI',
      'category': 'Transfer',
      'date': '21 Agu 2025',
      'amount': 'Rp 1,000,000',
      'source': 'Bank Mandiri',
      'isIncome': false,
    },
    {
      'title': 'Freelance Payment',
      'category': 'Income',
      'date': '20 Agu 2025',
      'amount': 'Rp 2,500,000',
      'source': 'Bank BCA',
      'isIncome': true,
    },
    {
      'title': 'Electric Bill',
      'category': 'Utilities',
      'date': '19 Agu 2025',
      'amount': 'Rp 250,000',
      'source': 'Bank Mandiri',
      'isIncome': false,
    },
    {
      'title': 'Restaurant',
      'category': 'Food & Dining',
      'date': '18 Agu 2025',
      'amount': 'Rp 125,000',
      'source': 'E-Wallet',
      'isIncome': false,
    },
    {
      'title': 'Online Course',
      'category': 'Education',
      'date': '17 Agu 2025',
      'amount': 'Rp 500,000',
      'source': 'Bank BRI',
      'isIncome': false,
    },
  ].obs;

  // Observable list untuk transaksi yang sudah difilter
  final RxList<Map<String, dynamic>> _filteredTransactions =
      <Map<String, dynamic>>[].obs;

  // Getter untuk transaksi yang sudah difilter
  List<Map<String, dynamic>> get filteredTransactions => _filteredTransactions;

  // Getter untuk recent transactions (4 data pertama)
  List<Map<String, dynamic>> get recentTransactions =>
      _allTransactions.take(4).toList();

  @override
  void onInit() {
    super.onInit();
    // Set initial filtered transactions ke semua transaksi
    _filteredTransactions.assignAll(_allTransactions);
  }

  @override
  void onClose() {
    searchController.dispose();
    super.onClose();
  }

  // Fungsi untuk search transaksi
  void searchTransactions(String query) {
    if (query.isEmpty) {
      _filteredTransactions.assignAll(_allTransactions);
    } else {
      final filtered = _allTransactions.where((transaction) {
        final title = transaction['title'].toString().toLowerCase();
        final category = transaction['category'].toString().toLowerCase();
        final source = transaction['source'].toString().toLowerCase();
        final searchQuery = query.toLowerCase();

        return title.contains(searchQuery) ||
            category.contains(searchQuery) ||
            source.contains(searchQuery);
      }).toList();

      _filteredTransactions.assignAll(filtered);
    }
  }

  // Fungsi untuk clear search
  void clearSearch() {
    searchController.clear();
    _filteredTransactions.assignAll(_allTransactions);
  }
}
