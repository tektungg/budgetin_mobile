import 'package:budgetin/features/setting/sub_features/about/controllers/about_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AboutScreen extends GetView<AboutController> {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("About"),
      ),
      body: const Center(),
    );
  }
}
