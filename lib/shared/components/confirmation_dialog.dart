import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/shared/controllers/dialog_controller.dart';

class ConfirmationDialogWidget extends StatelessWidget {
  final String title;
  final String description;
  final String confirmText;
  final String cancelText;
  final DialogVariant variant;
  final VoidCallback? onConfirm;
  final VoidCallback? onCancel;

  const ConfirmationDialogWidget({
    super.key,
    required this.title,
    required this.description,
    required this.confirmText,
    required this.cancelText,
    required this.variant,
    this.onConfirm,
    this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DialogController>();

    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        padding: EdgeInsets.all(24.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: AppColors.black.withValues(alpha: 0.1),
              blurRadius: 24.r,
              offset: Offset(0, 8.h),
            ),
          ],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Icon based on variant
            _buildIcon(),

            SizedBox(height: 16.h),

            // Title
            Text(
              title,
              style: AppFonts.primarySemiBold18.copyWith(
                color: AppColors.text1_1000,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 8.h),

            // Description
            Text(
              description,
              style: AppFonts.primaryRegular14.copyWith(
                color: AppColors.text1_600,
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 24.h),

            // Action Buttons
            Obx(() => Row(
                  children: [
                    // Cancel Button
                    Expanded(
                      child: TextButton(
                        onPressed: controller.isLoading
                            ? null
                            : () {
                                Get.back(result: false);
                                onCancel?.call();
                              },
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                            side: BorderSide(
                              color: AppColors.border,
                              width: 1,
                            ),
                          ),
                        ),
                        child: Text(
                          cancelText,
                          style: AppFonts.primaryMedium14.copyWith(
                            color: AppColors.text1_600,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(width: 12.w),

                    // Confirm Button
                    Expanded(
                      child: ElevatedButton(
                        onPressed: controller.isLoading
                            ? null
                            : () async {
                                if (onConfirm != null) {
                                  await controller.executeWithLoading(() async {
                                    onConfirm!();
                                  });
                                }
                                Get.back(result: true);
                              },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _getConfirmButtonColor(),
                          foregroundColor: AppColors.white,
                          padding: EdgeInsets.symmetric(vertical: 12.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          elevation: 0,
                        ),
                        child: controller.isLoading
                            ? SizedBox(
                                width: 20.w,
                                height: 20.w,
                                child: const CircularProgressIndicator(
                                  strokeWidth: 2,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      Colors.white),
                                ),
                              )
                            : Text(
                                confirmText,
                                style: AppFonts.primaryMedium14.copyWith(
                                  color: AppColors.white,
                                ),
                              ),
                      ),
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }

  Widget _buildIcon() {
    return Container(
      width: 64.w,
      height: 64.w,
      decoration: BoxDecoration(
        color: _getIconBackgroundColor(),
        shape: BoxShape.circle,
      ),
      child: Icon(
        _getIconData(),
        size: 32.w,
        color: _getIconColor(),
      ),
    );
  }

  IconData _getIconData() {
    switch (variant) {
      case DialogVariant.primary:
        return Icons.help_outline;
      case DialogVariant.destructive:
        return Icons.warning_outlined;
      case DialogVariant.success:
        return Icons.check_circle_outline;
      case DialogVariant.warning:
        return Icons.error_outline;
      case DialogVariant.info:
        return Icons.info_outline;
    }
  }

  Color _getIconColor() {
    switch (variant) {
      case DialogVariant.primary:
        return AppColors.primary;
      case DialogVariant.destructive:
        return AppColors.error;
      case DialogVariant.success:
        return AppColors.accent;
      case DialogVariant.warning:
        return const Color(0xFFF59E0B); // Orange
      case DialogVariant.info:
        return const Color(0xFF3B82F6); // Blue
    }
  }

  Color _getIconBackgroundColor() {
    switch (variant) {
      case DialogVariant.primary:
        return AppColors.primary.withValues(alpha: 0.1);
      case DialogVariant.destructive:
        return AppColors.error.withValues(alpha: 0.1);
      case DialogVariant.success:
        return AppColors.accent.withValues(alpha: 0.1);
      case DialogVariant.warning:
        return const Color(0xFFF59E0B).withValues(alpha: 0.1);
      case DialogVariant.info:
        return const Color(0xFF3B82F6).withValues(alpha: 0.1);
    }
  }

  Color _getConfirmButtonColor() {
    switch (variant) {
      case DialogVariant.primary:
        return AppColors.primary;
      case DialogVariant.destructive:
        return AppColors.error;
      case DialogVariant.success:
        return AppColors.accent;
      case DialogVariant.warning:
        return const Color(0xFFF59E0B); // Orange
      case DialogVariant.info:
        return const Color(0xFF3B82F6); // Blue
    }
  }
}
