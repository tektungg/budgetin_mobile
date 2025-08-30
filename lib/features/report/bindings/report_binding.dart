import 'package:budgetin/features/report/controllers/report_controller.dart';
import 'package:get/get.dart';
    
class ReportBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReportController>(() => ReportController());
  }
}
  