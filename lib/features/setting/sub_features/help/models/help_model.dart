import 'package:flutter/material.dart';

class FAQItem {
  final String id;
  final String question;
  final String answer;

  const FAQItem({
    required this.id,
    required this.question,
    required this.answer,
  });
}

class ContactMethod {
  final IconData icon;
  final String title;
  final String description;
  final String action;
  final ContactType type;

  const ContactMethod({
    required this.icon,
    required this.title,
    required this.description,
    required this.action,
    required this.type,
  });
}

enum ContactType {
  email,
  phone,
  chat,
  external,
}

class TipCard {
  final String emoji;
  final String title;
  final String description;
  final Color backgroundColor;
  final Color borderColor;
  final Color titleColor;
  final Color descriptionColor;

  const TipCard({
    required this.emoji,
    required this.title,
    required this.description,
    required this.backgroundColor,
    required this.borderColor,
    required this.titleColor,
    required this.descriptionColor,
  });
}
