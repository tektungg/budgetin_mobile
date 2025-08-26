import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/configs/pages/page.dart';
import 'package:budgetin/configs/routes/route.dart';
import 'package:budgetin/configs/themes/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Screen Util Init berdasarkan ukuran iphone xr
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GestureDetector(
          onTap: () => Get.focusScope?.unfocus(),
          child: GetMaterialApp(
            title: 'Budgetin',
            debugShowCheckedModeBanner: false,
            initialRoute: Routes.signInRoute,
            theme: themeLight,
            defaultTransition: Transition.native,
            getPages: Pages.pages,
          ),
        );
      },
    );
  }
}
