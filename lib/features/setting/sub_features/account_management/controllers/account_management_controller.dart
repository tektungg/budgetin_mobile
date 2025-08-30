import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:budgetin/features/setting/sub_features/account_management/models/account_model.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AccountManagementController extends GetxController {
  static AccountManagementController get to => Get.find();

  // Observable variables
  final RxList<Account> _accounts = <Account>[].obs;
  final RxBool _isAddModalOpen = false.obs;
  final RxBool _isEditModalOpen = false.obs;
  final Rx<Account?> _editingAccount = Rx<Account?>(null);
  final RxBool _isLoading = false.obs;

  // Form controllers
  final TextEditingController nameController = TextEditingController();
  final TextEditingController balanceController = TextEditingController();
  final RxString _selectedType = ''.obs;

  // Getters
  List<Account> get accounts => _accounts;
  bool get isAddModalOpen => _isAddModalOpen.value;
  bool get isEditModalOpen => _isEditModalOpen.value;
  Account? get editingAccount => _editingAccount.value;
  bool get isLoading => _isLoading.value;
  String get selectedType => _selectedType.value;

  // Account types
  List<AccountType> get accountTypes => [
        const AccountType(
          value: 'cash',
          label: 'Cash',
          icon: Icons.account_balance_wallet,
          color: Colors.green,
        ),
        const AccountType(
          value: 'bank',
          label: 'Bank',
          icon: Icons.account_balance,
          color: Colors.blue,
        ),
        const AccountType(
          value: 'ewallet',
          label: 'E-Wallet',
          icon: Icons.phone_android,
          color: Colors.purple,
        ),
        const AccountType(
          value: 'investment',
          label: 'Investment',
          icon: Icons.trending_up,
          color: Colors.orange,
        ),
        const AccountType(
          value: 'credit',
          label: 'Credit Card',
          icon: Icons.credit_card,
          color: Colors.red,
        ),
      ];

  @override
  void onInit() {
    super.onInit();
    _initializeAccounts();
  }

  @override
  void onClose() {
    nameController.dispose();
    balanceController.dispose();
    super.onClose();
  }

  void _initializeAccounts() {
    _accounts.addAll([
      Account(
        id: 'cash',
        name: 'Cash',
        type: 'cash',
        balance: 750000,
        icon: Icons.account_balance_wallet,
        color: Colors.green,
      ),
      Account(
        id: 'bri',
        name: 'BRI',
        type: 'bank',
        balance: 1500000,
        icon: Icons.account_balance,
        color: Colors.blue,
      ),
      Account(
        id: 'gopay',
        name: 'Gopay',
        type: 'ewallet',
        balance: 500000,
        icon: Icons.phone_android,
        color: Colors.purple,
      ),
    ]);
  }

  // Modal management
  void openAddModal() {
    _clearForm();
    _isAddModalOpen.value = true;
  }

  void closeAddModal() {
    _isAddModalOpen.value = false;
    _clearForm();
  }

  void openEditModal(Account account) {
    _editingAccount.value = account;
    nameController.text = account.name;
    _selectedType.value = account.type;
    balanceController.text = account.balance.toString();
    _isEditModalOpen.value = true;
  }

  void closeEditModal() {
    _isEditModalOpen.value = false;
    _editingAccount.value = null;
    _clearForm();
  }

  void _clearForm() {
    nameController.clear();
    balanceController.clear();
    _selectedType.value = '';
  }

  // Account type helper
  AccountType? getAccountType(String type) {
    try {
      return accountTypes
          .firstWhere((accountType) => accountType.value == type);
    } catch (e) {
      return null;
    }
  }

  IconData getIconForType(String type) {
    final accountType = getAccountType(type);
    return accountType?.icon ?? Icons.attach_money;
  }

  Color getColorForType(String type) {
    final accountType = getAccountType(type);
    return accountType?.color ?? Colors.grey;
  }

  void setSelectedType(String type) {
    _selectedType.value = type;
  }

  // Account operations
  void handleAddAccount() {
    if (!_validateForm()) return;

    _isLoading.value = true;

    final newAccount = Account(
      id: 'account_${DateTime.now().millisecondsSinceEpoch}',
      name: nameController.text,
      type: _selectedType.value,
      balance: double.tryParse(balanceController.text) ?? 0,
      icon: getIconForType(_selectedType.value),
      color: getColorForType(_selectedType.value),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      _accounts.add(newAccount);
      _isLoading.value = false;
      closeAddModal();

      Get.snackbar(
        'Success',
        'Account added successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.success,
        colorText: AppColors.white,
      );
    });
  }

  void handleUpdateAccount() {
    if (!_validateForm() || _editingAccount.value == null) return;

    _isLoading.value = true;

    final updatedAccount = _editingAccount.value!.copyWith(
      name: nameController.text,
      type: _selectedType.value,
      balance: double.tryParse(balanceController.text) ?? 0,
      icon: getIconForType(_selectedType.value),
      color: getColorForType(_selectedType.value),
    );

    Future.delayed(const Duration(milliseconds: 500), () {
      final index =
          _accounts.indexWhere((acc) => acc.id == _editingAccount.value!.id);
      if (index != -1) {
        _accounts[index] = updatedAccount;
      }

      _isLoading.value = false;
      closeEditModal();

      Get.snackbar(
        'Success',
        'Account updated successfully!',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.success,
        colorText: AppColors.white,
      );
    });
  }

  void handleDeleteAccount(String accountId) {
    Get.dialog(
      AlertDialog(
        title: const Text('Delete Account'),
        content: const Text(
            'Are you sure you want to delete this account? This action cannot be undone.'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              _accounts.removeWhere((acc) => acc.id == accountId);
              Get.back();

              Get.snackbar(
                'Success',
                'Account deleted successfully!',
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: AppColors.success,
                colorText: AppColors.white,
              );
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.error),
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  bool _validateForm() {
    if (nameController.text.isEmpty || _selectedType.value.isEmpty) {
      Get.snackbar(
        'Error',
        'Please fill in all required fields',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.error,
        colorText: AppColors.white,
      );
      return false;
    }
    return true;
  }

  // Calculations
  double get totalBalance {
    return _accounts.fold(0.0, (sum, account) => sum + account.balance);
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

  void navigateBack() {
    Get.back();
  }
}
