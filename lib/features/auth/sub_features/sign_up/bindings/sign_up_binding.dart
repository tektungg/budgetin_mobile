import 'package:budgetin/features/auth/controllers/auth_controller.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/auth/sub_features/sign_up/controllers/sign_up_controller.dart';

class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignUpController());
    Get.lazyPut(() => AuthController());
  }
}
