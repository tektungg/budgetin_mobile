import "package:flutter/material.dart";
import "package:get/get.dart";
import "package:budgetin/constants/asset_constant.dart";
import "package:budgetin/utils/functions/dialog_utils_function.dart";
import "package:budgetin/utils/services/api_service.dart";
import 'package:budgetin/shared/styles/styles.dart';
import "package:vpack/vpack.dart";

class NoConnectionScreen extends StatelessWidget {
  const NoConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(40),
          child: Column(
            children: [
              const SizedBox(height: 40),
              Text(
                "Koneksi Internet Anda Sedang Tidak Stabil",
                style: Get.textTheme.headlineSmall?.copyWith(
                  color: AppColors.text1_1000,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: VIlustration.asset(
                    AssetConstants.icNoSignal,
                    width: double.infinity,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Harap periksa kembali koneksi internet Anda sebelum kembali.",
                style: Get.textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              VButton(
                label: "Muat Ulang",
                layout: VButtonLayout.FULL,
                onTap: () async {
                  if (!(Get.isDialogOpen ?? false)) {
                    DialogUtilsFunction.showGlobalLoading();
                    final isConnected = await ApiService.checkInternet();
                    DialogUtilsFunction.closeGlobalLoading();
                    if (!isConnected) return;
                    Get.back();
                  }
                },
              ),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}
