import 'package:budgetin/features/setting/sub_features/account_management/controllers/account_management_controller.dart';
import 'package:get/get.dart';
    
class AccountManagementBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccountManagementController());
  }
}
  