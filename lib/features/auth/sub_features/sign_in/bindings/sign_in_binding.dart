import 'package:get/get.dart';
import 'package:budgetin/features/auth/controllers/auth_controller.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/controllers/sign_in_controller.dart';

class SignInBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignInController());
    Get.lazyPut(() => AuthController());
  }
}
