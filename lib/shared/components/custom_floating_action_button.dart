import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budgetin/shared/styles/styles.dart';

class SpeedDialFloatingActionButton extends StatefulWidget {
  final VoidCallback? onIncomePressed;
  final VoidCallback? onExpensePressed;
  final String incomeLabel;
  final String expenseLabel;

  const SpeedDialFloatingActionButton({
    super.key,
    this.onIncomePressed,
    this.onExpensePressed,
    this.incomeLabel = 'Income',
    this.expenseLabel = 'Expense',
  });

  @override
  State<SpeedDialFloatingActionButton> createState() =>
      _SpeedDialFloatingActionButtonState();
}

class _SpeedDialFloatingActionButtonState
    extends State<SpeedDialFloatingActionButton> with TickerProviderStateMixin {
  bool _isExpanded = false;
  late AnimationController _animationController;
  late Animation<double> _expandAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 250),
      vsync: this,
    );

    _expandAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeOut,
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _isExpanded = !_isExpanded;
    });

    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  void _handleIncomePressed() {
    _toggleExpansion();
    widget.onIncomePressed?.call();
  }

  void _handleExpensePressed() {
    _toggleExpansion();
    widget.onExpensePressed?.call();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        // Speed Dial Menu
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Income Option
            AnimatedBuilder(
              animation: _expandAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, 50.h * _expandAnimation.value),
                  child: Transform.scale(
                    scale: _expandAnimation.value,
                    child: Opacity(
                      opacity: _expandAnimation.value,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 6.h),
                            margin: EdgeInsets.only(right: 12.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withValues(alpha: 0.1),
                                  blurRadius: 4.r,
                                  offset: Offset(0, 2.h),
                                ),
                              ],
                            ),
                            child: Text(
                              widget.incomeLabel,
                              style: AppFonts.primaryMedium12.copyWith(
                                color: AppColors.text1_1000,
                              ),
                            ),
                          ),
                          FloatingActionButton.small(
                            heroTag: "income_speed_dial",
                            onPressed: _handleIncomePressed,
                            backgroundColor: AppColors.success,
                            child: Icon(
                              Icons.arrow_upward,
                              color: AppColors.white,
                              size: 18.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Expense Option
            AnimatedBuilder(
              animation: _expandAnimation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(0, -60.h * _expandAnimation.value),
                  child: Transform.scale(
                    scale: _expandAnimation.value,
                    child: Opacity(
                      opacity: _expandAnimation.value,
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 6.h),
                            margin: EdgeInsets.only(right: 12.w),
                            decoration: BoxDecoration(
                              color: AppColors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              boxShadow: [
                                BoxShadow(
                                  color: AppColors.black.withValues(alpha: 0.1),
                                  blurRadius: 4.r,
                                  offset: Offset(0, 2.h),
                                ),
                              ],
                            ),
                            child: Text(
                              widget.expenseLabel,
                              style: AppFonts.primaryMedium12.copyWith(
                                color: AppColors.text1_1000,
                              ),
                            ),
                          ),
                          FloatingActionButton.small(
                            heroTag: "expense_speed_dial",
                            onPressed: _handleExpensePressed,
                            backgroundColor: AppColors.error,
                            child: Icon(
                              Icons.arrow_downward,
                              color: AppColors.white,
                              size: 18.w,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),

            // Main FAB
            SizedBox(height: 8.h),
            FloatingActionButton(
              heroTag: "main_speed_dial",
              onPressed: _toggleExpansion,
              backgroundColor: AppColors.primary,
              child: AnimatedRotation(
                turns: _isExpanded ? 0.125 : 0, // 45 degrees
                duration: const Duration(milliseconds: 250),
                child: Icon(
                  _isExpanded ? Icons.close : Icons.add,
                  color: AppColors.white,
                  size: 24.w,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
