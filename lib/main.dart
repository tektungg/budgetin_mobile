import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:budgetin/env/env.dart';
import 'package:budgetin/app.dart';
import 'package:budgetin/flavors.dart';
import 'package:budgetin/utils/services/api_service.dart';
import 'package:budgetin/utils/services/applink_service.dart';
import 'package:budgetin/utils/services/hive_service.dart';
import 'package:budgetin/utils/services/supabase_service.dart';
import 'package:vpack/vpack.dart';
import 'utils/services/sentry_services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  /* Uncomment jika sudah membuat Firebase Options
   await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform); 
  */

  await _initServices();
}

Future<void> _initServices() async {
  log("Env Key ${Env.key}");
  await VPack.initialize();
  await F.init();

  // Initialize Supabase first
  await Get.putAsync(() => SupabaseService().init());

  await Get.putAsync(() => HiveService().initHive());
  /* Uncomment jika sudah membuat Firebase Options 
   await Get.putAsync(() => LocalNotificationService().initNotification());
   await Get.putAsync(() => FirebaseNotificationService().init());
  */
  await Get.putAsync(() => ApplinkService().initApplink());
  await Get.putAsync(() => ApiService().init());
  // await Get.putAsync(() => AmplitudeServices().init());

  await SentryFlutter.init(
    SentryService.instance.initializeConfiguration,
    appRunner: () => runApp(const MyApp()),
  );
}
