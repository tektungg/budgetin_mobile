import 'package:budgetin/features/home/bindings/home_binding.dart';
import 'package:budgetin/features/report/bindings/report_binding.dart';
import 'package:budgetin/features/report/screen/ui/report_screen.dart';
import 'package:budgetin/features/setting/bindings/setting_binding.dart';
import 'package:budgetin/features/setting/screen/ui/setting_screen.dart';
import 'package:budgetin/features/setting/sub_features/about/bindings/about_binding.dart';
import 'package:budgetin/features/setting/sub_features/about/view/ui/about_screen.dart';
import 'package:budgetin/features/setting/sub_features/account_management/bindings/account_management_binding.dart';
import 'package:budgetin/features/setting/sub_features/account_management/view/ui/account_management_screen.dart';
import 'package:budgetin/features/setting/sub_features/edit_profile/bindings/edit_profile_binding.dart';
import 'package:budgetin/features/setting/sub_features/edit_profile/view/ui/edit_profile_screen.dart';
import 'package:budgetin/features/setting/sub_features/help/bindings/help_binding.dart';
import 'package:budgetin/features/setting/sub_features/help/view/ui/help_screen.dart';
import 'package:budgetin/features/setting/sub_features/settings/bindings/settings_binding.dart';
import 'package:budgetin/features/setting/sub_features/settings/view/ui/settings_screen.dart';
import 'package:budgetin/features/transaction/bindings/transaction_binding.dart';
import 'package:budgetin/features/transaction/screen/ui/transaction_screen.dart';
import 'package:get/get.dart';
import 'package:budgetin/configs/routes/route.dart';
import 'package:budgetin/features/no_connection/view/ui/no_connection_screen.dart';
import 'package:budgetin/features/splash/bindings/splash_binding.dart';
import 'package:budgetin/features/splash/view/ui/splash_screen.dart';
import 'package:budgetin/features/auth/bindings/auth_binding.dart';
import 'package:budgetin/features/auth/screen/ui/auth_screen.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/bindings/sign_in_binding.dart';
import 'package:budgetin/features/auth/sub_features/sign_in/view/ui/sign_in_screen.dart';
import 'package:budgetin/features/auth/sub_features/sign_up/bindings/sign_up_binding.dart';
import 'package:budgetin/features/auth/sub_features/sign_up/view/ui/sign_up_screen.dart';
import 'package:budgetin/features/home/screen/ui/home_screen.dart';
import 'package:budgetin/features/auth/sub_features/forgot_password/bindings/forgot_password_binding.dart';
import 'package:budgetin/features/auth/sub_features/forgot_password/view/ui/forgot_password_screen.dart';

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
    GetPage(
      name: Routes.authRoute,
      page: () => const AuthScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signInRoute,
      page: () => const SignInScreen(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.signUpRoute,
      page: () => const SignUpScreen(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.homeRoute,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: Routes.forgotPasswordRoute,
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
  GetPage(
      name: Routes.transactionRoute,
      page: () => const TransactionScreen(),
      binding: TransactionBinding(),
    ),
  GetPage(
      name: Routes.settingRoute,
      page: () => const SettingScreen(),
      binding: SettingBinding(),
    ),
  GetPage(
      name: Routes.reportRoute,
      page: () => const ReportScreen(),
      binding: ReportBinding(),
    ),
  GetPage(
      name: Routes.editProfileRoute,
      page: () => const EditProfileScreen(),
      binding: EditProfileBinding(),
    ),
  GetPage(
      name: Routes.accountManagementRoute,
      page: () => const AccountManagementScreen(),
      binding: AccountManagementBinding(),
    ),
  GetPage(
      name: Routes.settingsRoute,
      page: () => const SettingsScreen(),
      binding: SettingsBinding(),
    ),
  GetPage(
      name: Routes.helpRoute,
      page: () => const HelpScreen(),
      binding: HelpBinding(),
    ),
  GetPage(
      name: Routes.aboutRoute,
      page: () => const AboutScreen(),
      binding: AboutBinding(),
    ),
  ];
}