import 'package:budgetin/features/add_income/controllers/add_income_controller.dart';
import 'package:get/get.dart';
    
class AddIncomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AddIncomeController());
  }
}
  