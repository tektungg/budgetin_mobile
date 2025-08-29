import 'package:budgetin/shared/styles/google_text_style.dart';
import 'package:budgetin/shared/components/components.dart';
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
      titleTextStyle: GoogleTextStyle.fw600.copyWith(color: Colors.white),
      centerTitle: true,
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
      leadingIcon: Icons.arrow_back_ios_new,
      onLeadingPressed: controller.goBack,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
