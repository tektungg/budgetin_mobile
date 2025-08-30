import 'package:budgetin/features/setting/controllers/setting_controller.dart';
import 'package:budgetin/shared/controllers/auth_controller.dart';
import 'package:get/get.dart';

class SettingBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure AuthController is available
    if (!Get.isRegistered<AuthController>()) {
      Get.put<AuthController>(AuthController());
    }

    Get.lazyPut<SettingController>(() => SettingController());
  }
}
