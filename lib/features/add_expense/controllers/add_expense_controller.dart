import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/add_expense/models/expense_model.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/configs/routes/route.dart';
import 'package:intl/intl.dart';

class AddExpenseController extends GetxController {
  static AddExpenseController get to => Get.find();

  // Form data
  final Rx<ExpenseFormData> _formData = ExpenseFormData(
    amount: '',
    description: '',
    category: '',
    account: '',
    date: DateTime.now(),
    notes: '',
  ).obs;

  ExpenseFormData get formData => _formData.value;

  // Loading state
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  // Form controllers
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final notesController = TextEditingController();

  // Static data
  final List<Account> accounts = [
    const Account(
      id: 'cash',
      name: 'Cash',
      icon: Icons.account_balance_wallet,
      balance: 750000,
    ),
    const Account(
      id: 'bri',
      name: 'BRI',
      icon: Icons.account_balance,
      balance: 1500000,
    ),
    const Account(
      id: 'gopay',
      name: 'Gopay',
      icon: Icons.phone_android,
      balance: 500000,
    ),
  ];

  final List<ExpenseCategory> categories = [
    ExpenseCategory(
      id: 'food',
      name: 'Makanan & Minuman',
      icon: Icons.restaurant,
      color: AppColors.warning.withValues(alpha: 0.2),
    ),
    ExpenseCategory(
      id: 'transport',
      name: 'Transportasi',
      icon: Icons.directions_car,
      color: AppColors.info.withValues(alpha: 0.2),
    ),
    ExpenseCategory(
      id: 'shopping',
      name: 'Belanja',
      icon: Icons.shopping_bag,
      color: AppColors.secondary.withValues(alpha: 0.2),
    ),
    ExpenseCategory(
      id: 'entertainment',
      name: 'Hiburan',
      icon: Icons.games,
      color: AppColors.error.withValues(alpha: 0.2),
    ),
    ExpenseCategory(
      id: 'health',
      name: 'Kesehatan',
      icon: Icons.favorite,
      color: AppColors.error.withValues(alpha: 0.2),
    ),
    ExpenseCategory(
      id: 'education',
      name: 'Pendidikan',
      icon: Icons.school,
      color: AppColors.primary.withValues(alpha: 0.2),
    ),
    ExpenseCategory(
      id: 'bills',
      name: 'Tagihan',
      icon: Icons.receipt,
      color: AppColors.text1_300,
    ),
    ExpenseCategory(
      id: 'gifts',
      name: 'Hadiah',
      icon: Icons.card_giftcard,
      color: AppColors.warning.withValues(alpha: 0.2),
    ),
    ExpenseCategory(
      id: 'home',
      name: 'Rumah Tangga',
      icon: Icons.home,
      color: AppColors.success.withValues(alpha: 0.2),
    ),
  ];

  @override
  void onInit() {
    super.onInit();
    // Initialize form data with today's date
    _formData.value = _formData.value.copyWith(date: DateTime.now());
  }

  @override
  void onClose() {
    amountController.dispose();
    descriptionController.dispose();
    notesController.dispose();
    super.onClose();
  }

  // Update form field
  void updateFormField(String field, dynamic value) {
    switch (field) {
      case 'amount':
        _formData.value = _formData.value.copyWith(amount: value as String);
        break;
      case 'description':
        _formData.value =
            _formData.value.copyWith(description: value as String);
        break;
      case 'category':
        _formData.value = _formData.value.copyWith(category: value as String);
        break;
      case 'account':
        _formData.value = _formData.value.copyWith(account: value as String);
        break;
      case 'date':
        _formData.value = _formData.value.copyWith(date: value as DateTime);
        break;
      case 'notes':
        _formData.value = _formData.value.copyWith(notes: value as String);
        break;
    }
  }

  // Get selected account
  Account? get selectedAccount {
    return accounts
        .firstWhereOrNull((account) => account.id == formData.account);
  }

  // Format currency
  String formatCurrency(double amount) {
    final formatter = NumberFormat.currency(
      locale: 'id_ID',
      symbol: 'Rp ',
      decimalDigits: 0,
    );
    return formatter.format(amount);
  }

  // Get balance after expense
  double get balanceAfterExpense {
    final selectedAcc = selectedAccount;
    final amount = double.tryParse(formData.amount) ?? 0;
    if (selectedAcc != null) {
      return selectedAcc.balance - amount;
    }
    return 0;
  }

  // Validate form
  bool _validateForm() {
    if (formData.amount.isEmpty ||
        formData.description.isEmpty ||
        formData.category.isEmpty ||
        formData.account.isEmpty) {
      Get.snackbar(
        'Error',
        'Mohon lengkapi semua field yang wajib diisi',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }

    final amount = double.tryParse(formData.amount);
    if (amount == null || amount <= 0) {
      Get.snackbar(
        'Error',
        'Jumlah pengeluaran harus berupa angka yang valid',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }

    final selectedAcc = selectedAccount;
    if (selectedAcc != null && amount > selectedAcc.balance) {
      Get.snackbar(
        'Error',
        'Saldo ${selectedAcc.name} tidak mencukupi',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }

    return true;
  }

  // Save expense
  Future<void> saveExpense() async {
    if (!_validateForm()) return;

    _isLoading.value = true;

    try {
      // Mock API call
      await Future.delayed(const Duration(seconds: 1));

      Get.snackbar(
        'Success',
        'Pengeluaran berhasil disimpan!',
        backgroundColor: AppColors.success,
        colorText: AppColors.white,
        snackPosition: SnackPosition.TOP,
      );

      // Navigate back to home
      Get.offAllNamed(Routes.homeRoute);
    } catch (error) {
      Get.snackbar(
        'Error',
        'Gagal menyimpan pengeluaran. Silakan coba lagi.',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      _isLoading.value = false;
    }
  }

  // Cancel and go back
  void cancel() {
    Get.back();
  }
}
