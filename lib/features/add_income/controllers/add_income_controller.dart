import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/add_income/models/income_model.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/configs/routes/route.dart';
import 'package:intl/intl.dart';

class AddIncomeController extends GetxController {
  static AddIncomeController get to => Get.find();

  // Form data
  final Rx<IncomeFormData> _formData = IncomeFormData(
    amount: '',
    description: '',
    category: '',
    account: '',
    date: DateTime.now(),
    notes: '',
  ).obs;

  IncomeFormData get formData => _formData.value;

  // Loading state
  final RxBool _isLoading = false.obs;
  bool get isLoading => _isLoading.value;

  // Form controllers
  final amountController = TextEditingController();
  final descriptionController = TextEditingController();
  final notesController = TextEditingController();

  // Static data
  final List<IncomeAccount> accounts = [
    const IncomeAccount(
      id: 'cash',
      name: 'Cash',
      icon: Icons.account_balance_wallet,
      balance: 750000,
    ),
    const IncomeAccount(
      id: 'bri',
      name: 'BRI',
      icon: Icons.account_balance,
      balance: 1500000,
    ),
    const IncomeAccount(
      id: 'gopay',
      name: 'Gopay',
      icon: Icons.phone_android,
      balance: 500000,
    ),
  ];

  final List<IncomeCategory> categories = [
    IncomeCategory(
      id: 'salary',
      name: 'Gaji',
      icon: Icons.work,
      color: AppColors.info.withValues(alpha:0.2),
    ),
    IncomeCategory(
      id: 'freelance',
      name: 'Freelance',
      icon: Icons.trending_up,
      color: AppColors.secondary.withValues(alpha:0.2),
    ),
    IncomeCategory(
      id: 'business',
      name: 'Bisnis',
      icon: Icons.business,
      color: AppColors.success.withValues(alpha:0.2),
    ),
    IncomeCategory(
      id: 'investment',
      name: 'Investasi',
      icon: Icons.savings,
      color: AppColors.warning.withValues(alpha:0.2),
    ),
    IncomeCategory(
      id: 'bonus',
      name: 'Bonus',
      icon: Icons.emoji_events,
      color: AppColors.warning.withValues(alpha:0.2),
    ),
    IncomeCategory(
      id: 'gift',
      name: 'Hadiah',
      icon: Icons.card_giftcard,
      color: AppColors.error.withValues(alpha:0.2),
    ),
    IncomeCategory(
      id: 'loan',
      name: 'Pinjaman',
      icon: Icons.payments,
      color: AppColors.error.withValues(alpha:0.2),
    ),
    IncomeCategory(
      id: 'other',
      name: 'Lainnya',
      icon: Icons.more_horiz,
      color: AppColors.text1_300,
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
  IncomeAccount? get selectedAccount {
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

  // Get balance after income
  double get balanceAfterIncome {
    final selectedAcc = selectedAccount;
    final amount = double.tryParse(formData.amount) ?? 0;
    if (selectedAcc != null) {
      return selectedAcc.balance + amount;
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
        'Jumlah pemasukan harus berupa angka yang valid',
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
        snackPosition: SnackPosition.TOP,
      );
      return false;
    }

    return true;
  }

  // Save income
  Future<void> saveIncome() async {
    if (!_validateForm()) return;

    _isLoading.value = true;

    try {
      // Mock API call
      await Future.delayed(const Duration(seconds: 1));

      Get.snackbar(
        'Success',
        'Pemasukan berhasil disimpan!',
        backgroundColor: AppColors.success,
        colorText: AppColors.white,
        snackPosition: SnackPosition.TOP,
      );

      // Navigate back to home
      Get.offAllNamed(Routes.homeRoute);
    } catch (error) {
      Get.snackbar(
        'Error',
        'Gagal menyimpan pemasukan. Silakan coba lagi.',
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
