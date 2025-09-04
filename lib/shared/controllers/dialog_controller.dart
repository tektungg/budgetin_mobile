import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/shared/components/confirmation_dialog.dart';

enum DialogVariant {
  primary,
  destructive,
  success,
  warning,
  info,
}

class DialogController extends GetxController {
  static DialogController get to => Get.find();

  final RxBool _isLoading = false.obs;

  bool get isLoading => _isLoading.value;

  void setLoading(bool loading) {
    _isLoading.value = loading;
  }

  Future<bool?> showConfirmationDialog({
    required String title,
    required String description,
    String? confirmText,
    String? cancelText,
    DialogVariant variant = DialogVariant.primary,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) async {
    return await Get.dialog<bool>(
      ConfirmationDialogWidget(
        title: title,
        description: description,
        confirmText: confirmText ?? 'Confirm',
        cancelText: cancelText ?? 'Cancel',
        variant: variant,
        onConfirm: onConfirm,
        onCancel: onCancel,
      ),
      barrierDismissible: false,
    );
  }

  Future<bool?> showLogoutDialog({
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) async {
    return await showConfirmationDialog(
      title: 'Logout',
      description: 'Are you sure you want to logout?',
      confirmText: 'Logout',
      variant: DialogVariant.warning,
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  Future<bool?> showDeleteDialog({
    String? title,
    String? description,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) async {
    return await showConfirmationDialog(
      title: title ?? 'Delete Data',
      description: description ??
          'Are you sure you want to delete this data? This action cannot be undone.',
      confirmText: 'Delete',
      variant: DialogVariant.destructive,
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  Future<bool?> showSaveDialog({
    String? title,
    String? description,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) async {
    return await showConfirmationDialog(
      title: title ?? 'Save Changes',
      description: description ??
          'Changes will be saved permanently. Do you want to continue?',
      confirmText: 'Save',
      variant: DialogVariant.success,
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  Future<void> executeWithLoading(Future<void> Function() action) async {
    try {
      setLoading(true);
      await action();
    } finally {
      setLoading(false);
    }
  }
}
