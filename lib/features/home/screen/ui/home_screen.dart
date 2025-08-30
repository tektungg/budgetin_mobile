import 'package:budgetin/configs/routes/route.dart';
import 'package:budgetin/shared/components/custom_bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:budgetin/features/home/controllers/home_controller.dart';
import 'package:budgetin/shared/styles/styles.dart';
import 'package:budgetin/features/home/screen/components/index.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: SafeArea(
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            // Header as SliverPersistentHeader
            SliverPersistentHeader(
              pinned: false,
              floating: false,
              delegate: _HomeHeaderDelegate(
                minHeight: MediaQuery.of(context).size.height * 0.091,
                maxHeight: MediaQuery.of(context).size.height * 0.22,
              ),
            ),

            // Main scrollable content
            SliverList(
              delegate: SliverChildListDelegate([
                // Spacing for smooth transition
                SizedBox(height: 10.h),

                // Account Balance
                const AccountBalance(),

                SizedBox(height: 20.h),

                // Monthly Income/Expense
                const MonthlySummary(),

                SizedBox(height: 10.h),

                // Recent Transactions
                const RecentTransactions(),

                SizedBox(height: 20.h),
              ]),
            ),
          ],
        ),
      ),
      // Bottom Navigation
      bottomNavigationBar: CustomBottomNavBar(
        currentRoute: Routes.homeRoute,
      ),
    );
  }
}

class _HomeHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double minHeight;
  final double maxHeight;

  _HomeHeaderDelegate({
    required this.minHeight,
    required this.maxHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return const HomeHeader();
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
