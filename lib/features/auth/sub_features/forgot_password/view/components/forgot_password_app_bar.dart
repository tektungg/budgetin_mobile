import 'package:budgetin/shared/components/components.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/forgot_password/controllers/forgot_password_controller.dart';

class ForgotPasswordAppBar extends GetView<ForgotPasswordController>
    implements PreferredSizeWidget {
  const ForgotPasswordAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAppBar(
      title: 'Reset Password',
      titleTextStyle: AppFonts.primaryBold20.copyWith(
        color: AppColors.white,
      ),
      centerTitle: true,
      backgroundColor: AppColors.primary,
      foregroundColor: AppColors.white,
      leadingIcon: Icons.arrow_back_ios_new,
      onLeadingPressed: controller.goBack,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
