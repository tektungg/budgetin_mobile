import 'package:budgetin/features/setting/controllers/setting_controller.dart';
import 'package:budgetin/features/auth/controllers/auth_controller.dart';
import 'package:budgetin/shared/controllers/dialog_controller.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure AuthController is available
    if (!Get.isRegistered<AuthController>()) {
      Get.put<AuthController>(AuthController());
    }

    // Ensure DialogController is available
    if (!Get.isRegistered<DialogController>()) {
      Get.put<DialogController>(DialogController());
    }

    Get.lazyPut<SettingController>(() => SettingController());
  }
}
