import 'package:get/get.dart';
import 'package:budgetin/configs/routes/route.dart';
import 'package:budgetin/features/no_connection/view/ui/no_connection_screen.dart';
import 'package:budgetin/features/splash/bindings/splash_binding.dart';
import 'package:budgetin/features/splash/view/ui/splash_screen.dart';

abstract class Pages {
  static final pages = [
    GetPage(
      name: Routes.splashRoute,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: Routes.noConnection,
      page: () => const NoConnectionScreen(),
    ),
  ];
}
