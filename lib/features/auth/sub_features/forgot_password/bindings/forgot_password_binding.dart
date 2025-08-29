import 'package:budgetin/features/auth/sub_features/forgot_password/controllers/forgot_password_controller.dart';
import 'package:get/get.dart';
    
class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotPasswordController>(() => ForgotPasswordController());
  }
}
  