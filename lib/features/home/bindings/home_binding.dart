import 'package:budgetin/features/home/controllers/home_controller.dart';
import 'package:budgetin/features/auth/controllers/auth_controller.dart';
import 'package:budgetin/features/transaction/controllers/transaction_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    // Ensure AuthController is available
    if (!Get.isRegistered<AuthController>()) {
      Get.lazyPut<AuthController>(() => AuthController());
    }

    // Register HomeController
    Get.lazyPut<HomeController>(() => HomeController());

    // Register TransactionController untuk akses dari home screen
    Get.lazyPut<TransactionController>(() => TransactionController());
  }
}
