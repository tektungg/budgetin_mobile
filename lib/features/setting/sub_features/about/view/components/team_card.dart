import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/setting/sub_features/about/controllers/about_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';

class TeamCard extends GetView<AboutController> {
  const TeamCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.1),
            blurRadius: 8.r,
            offset: Offset(0, 2.h),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Development Team',
            style: AppFonts.primaryBold16.copyWith(
              color: AppColors.text1_1000,
            ),
          ),
          SizedBox(height: 16.h),
          ...controller.team.map((member) => Padding(
                padding: EdgeInsets.only(bottom: 12.h),
                child: _buildTeamMember(member),
              )),
        ],
      ),
    );
  }

  Widget _buildTeamMember(dynamic member) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  member.name,
                  style: AppFonts.primaryMedium14.copyWith(
                    color: AppColors.text1_1000,
                  ),
                ),
                SizedBox(height: 2.h),
                Text(
                  member.role,
                  style: AppFonts.primaryRegular12.copyWith(
                    color: AppColors.text1_500,
                  ),
                ),
              ],
            ),
          ),
          Icon(
            Icons.favorite,
            size: 18.w,
            color: AppColors.error,
          ),
        ],
      ),
    );
  }
}
