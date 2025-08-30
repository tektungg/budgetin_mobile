import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:budgetin/shared/styles/styles.dart';

class AccountBalance extends StatelessWidget {
  final List<Map<String, dynamic>> accountData;

  const AccountBalance({
    super.key,
    this.accountData = const [
      {
        'name': 'Cash',
        'balance': 'Rp 2,500,000',
        'icon': Icons.account_balance_wallet
      },
      {
        'name': 'Banking',
        'balance': 'Rp 10,750,000',
        'icon': Icons.account_balance
      },
      {
        'name': 'E-Wallet',
        'balance': 'Rp 2,000,000',
        'icon': Icons.phone_android
      },
    ],
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 24.w),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(12.r),
          border: Border.all(color: AppColors.border),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Balance',
              style: AppFonts.primaryBold16.copyWith(
                color: AppColors.text1_1000,
              ),
            ),
            SizedBox(height: 16.h),
            ...accountData.asMap().entries.map((entry) {
              final index = entry.key;
              final account = entry.value;
              return Column(
                children: [
                  _buildAccountBalanceRow(
                    accountType: account['name'],
                    balance: account['balance'],
                    icon: account['icon'],
                  ),
                  if (index < accountData.length - 1) SizedBox(height: 12.h),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildAccountBalanceRow({
    required String accountType,
    required String balance,
    required IconData icon,
  }) {
    return Row(
      children: [
        Container(
          padding: EdgeInsets.all(8.w),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha:0.1),
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 20.w,
          ),
        ),
        SizedBox(width: 12.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                accountType,
                style: AppFonts.primaryRegular12.copyWith(
                  color: AppColors.text1_600,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                balance,
                style: AppFonts.primaryBold16.copyWith(
                  color: AppColors.text1_1000,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
