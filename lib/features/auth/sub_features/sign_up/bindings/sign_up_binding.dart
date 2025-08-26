import 'package:budgetin/features/auth/sub_features/sign_up/controllers/sign_up_controller.dart';
import 'package:get/get.dart';
    
class SignUpBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SignUpController());
  }
}
  