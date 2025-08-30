import 'package:budgetin/features/setting/sub_features/about/bindings/about_binding.dart';
import 'package:budgetin/features/setting/sub_features/about/view/ui/about_screen.dart';
import 'package:get/get.dart';

class AboutPage {
  static const String routeName = '/about';

  static GetPage get page => GetPage(
        name: routeName,
        page: () => const AboutScreen(),
        binding: AboutBinding(),
      );
}
