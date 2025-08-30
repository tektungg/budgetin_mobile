import 'package:budgetin/features/setting/sub_features/help/bindings/help_binding.dart';
import 'package:budgetin/features/setting/sub_features/help/view/ui/help_screen.dart';
import 'package:get/get.dart';

class HelpPage {
  static const String routeName = '/help';

  static GetPage get page => GetPage(
        name: routeName,
        page: () => const HelpScreen(),
        binding: HelpBinding(),
      );
}
