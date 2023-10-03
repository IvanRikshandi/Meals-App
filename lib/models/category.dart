import 'package:flutter/material.dart';

class ModelCategory {
  final String id;
  final String title;
  final Color color;

  const ModelCategory({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}
