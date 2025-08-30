import 'package:flutter/material.dart';

class AppInfo {
  final String name;
  final String description;
  final String version;
  final String releaseYear;
  final String rating;

  const AppInfo({
    required this.name,
    required this.description,
    required this.version,
    required this.releaseYear,
    required this.rating,
  });
}

class Feature {
  final IconData icon;
  final String title;
  final String description;

  const Feature({
    required this.icon,
    required this.title,
    required this.description,
  });
}

class TeamMember {
  final String name;
  final String role;

  const TeamMember({
    required this.name,
    required this.role,
  });
}

class PolicyLink {
  final String title;
  final String url;

  const PolicyLink({
    required this.title,
    required this.url,
  });
}
