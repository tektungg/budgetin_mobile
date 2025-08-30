import 'package:budgetin/features/setting/sub_features/account_management/controllers/account_management_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountManagementScreen extends GetView<AccountManagementController> {
  const AccountManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("AccountManagement"),
      ),
      body: const Center(),
    );
  }
}
    