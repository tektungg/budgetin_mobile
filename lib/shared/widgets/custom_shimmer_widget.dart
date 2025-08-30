// ignore_for_file: deprecated_member_use

import "package:flutter/material.dart";
import "package:flutter_screenutil/flutter_screenutil.dart";
import "package:shimmer/shimmer.dart";
import 'package:budgetin/shared/styles/styles.dart';

class CustomShimmerWidget extends StatelessWidget {
  final double width;
  final double height;
  final double? radius;

  const CustomShimmerWidget({
    super.key,
    required this.width,
    required this.height,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.text1_200.withValues(alpha: 0.3),
      highlightColor: AppColors.white,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius ?? 8.r),
          color: AppColors.text1_200,
        ),
        width: width,
        height: height,
      ),
    );
  }
}
