import 'package:budgetin/features/setting/sub_features/help/controllers/help_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HelpScreen extends GetView<HelpController> {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Help"),
      ),
      body: const Center(),
    );
  }
}
    