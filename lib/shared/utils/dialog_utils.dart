import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/shared/controllers/dialog_controller.dart';

/// Utility class for easy access to confirmation dialogs
/// This provides static methods to quickly show dialogs without needing to inject controllers
class DialogUtils {
  static DialogController get _controller {
    if (!Get.isRegistered<DialogController>()) {
      Get.put<DialogController>(DialogController());
    }
    return Get.find<DialogController>();
  }

  /// Show a basic confirmation dialog
  static Future<bool?> showConfirmation({
    required String title,
    required String description,
    String? confirmText,
    String? cancelText,
    DialogVariant variant = DialogVariant.primary,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return _controller.showConfirmationDialog(
      title: title,
      description: description,
      confirmText: confirmText,
      cancelText: cancelText,
      variant: variant,
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  /// Show a logout confirmation dialog
  static Future<bool?> showLogout({
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return _controller.showLogoutDialog(
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  /// Show a delete confirmation dialog
  static Future<bool?> showDelete({
    String? title,
    String? description,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return _controller.showDeleteDialog(
      title: title,
      description: description,
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  /// Show a save confirmation dialog
  static Future<bool?> showSave({
    String? title,
    String? description,
    VoidCallback? onConfirm,
    VoidCallback? onCancel,
  }) {
    return _controller.showSaveDialog(
      title: title,
      description: description,
      onConfirm: onConfirm,
      onCancel: onCancel,
    );
  }

  /// Execute an action with loading state
  static Future<void> executeWithLoading(Future<void> Function() action) {
    return _controller.executeWithLoading(action);
  }
}

/// Extension methods for common use cases
extension DialogExtensions on GetxController {
  /// Quick access to dialog utils for controllers
  DialogController get dialog => Get.find<DialogController>();
}
