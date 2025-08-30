import 'package:flutter/material.dart';

class IncomeFormData {
  final String amount;
  final String description;
  final String category;
  final String account;
  final DateTime date;
  final String notes;

  const IncomeFormData({
    required this.amount,
    required this.description,
    required this.category,
    required this.account,
    required this.date,
    required this.notes,
  });

  IncomeFormData copyWith({
    String? amount,
    String? description,
    String? category,
    String? account,
    DateTime? date,
    String? notes,
  }) {
    return IncomeFormData(
      amount: amount ?? this.amount,
      description: description ?? this.description,
      category: category ?? this.category,
      account: account ?? this.account,
      date: date ?? this.date,
      notes: notes ?? this.notes,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'description': description,
      'category': category,
      'account': account,
      'date': date.toIso8601String(),
      'notes': notes,
    };
  }
}

class IncomeAccount {
  final String id;
  final String name;
  final IconData icon;
  final double balance;

  const IncomeAccount({
    required this.id,
    required this.name,
    required this.icon,
    required this.balance,
  });
}

class IncomeCategory {
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  const IncomeCategory({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}
