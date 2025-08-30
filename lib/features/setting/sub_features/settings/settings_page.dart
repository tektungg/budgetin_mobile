import 'package:budgetin/features/setting/sub_features/settings/bindings/settings_binding.dart';
import 'package:budgetin/features/setting/sub_features/settings/view/ui/settings_screen.dart';
import 'package:get/get.dart';

class SettingsPage {
  static const String routeName = '/settings';

  static GetPage get page => GetPage(
        name: routeName,
        page: () => const SettingsScreen(),
        binding: SettingsBinding(),
      );
}
