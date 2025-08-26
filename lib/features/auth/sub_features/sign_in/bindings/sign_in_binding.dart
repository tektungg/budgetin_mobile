import 'package:get/get.dart';
import 'package:budgetin/features/auth/controllers/auth_controller.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/controllers/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    // Delete existing controllers to prevent conflicts
    Get.delete<SignInController>(force: true);
    Get.delete<AuthController>(force: true);

    // Create new instances immediately
    Get.put<AuthController>(AuthController(), permanent: false);
    Get.put<SignInController>(SignInController(), permanent: false);
  }
}
