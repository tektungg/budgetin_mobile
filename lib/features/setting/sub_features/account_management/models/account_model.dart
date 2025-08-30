import 'package:flutter/material.dart';

class Account {
  final String id;
  final String name;
  final String type;
  final double balance;
  final IconData icon;
  final Color color;

  Account({
    required this.id,
    required this.name,
    required this.type,
    required this.balance,
    required this.icon,
    required this.color,
  });

  Account copyWith({
    String? id,
    String? name,
    String? type,
    double? balance,
    IconData? icon,
    Color? color,
  }) {
    return Account(
      id: id ?? this.id,
      name: name ?? this.name,
      type: type ?? this.type,
      balance: balance ?? this.balance,
      icon: icon ?? this.icon,
      color: color ?? this.color,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'type': type,
      'balance': balance,
    };
  }

  factory Account.fromJson(Map<String, dynamic> json) {
    return Account(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      balance: json['balance'].toDouble(),
      icon: Icons.account_balance, // Default icon, will be set by type
      color: Colors.blue, // Default color, will be set by type
    );
  }
}

class AccountType {
  final String value;
  final String label;
  final IconData icon;
  final Color color;

  const AccountType({
    required this.value,
    required this.label,
    required this.icon,
    required this.color,
  });
}
