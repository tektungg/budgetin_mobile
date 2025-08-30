import 'package:budgetin/features/setting/sub_features/settings/controllers/settings_controller.dart';
import 'package:get/get.dart';
    
class SettingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}
  