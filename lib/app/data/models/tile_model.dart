import 'package:flutter/material.dart';

class TileModel {
  final IconData icon;
  final String title;
  final void Function() function;

  TileModel({
    required this.icon,
    required this.title,
    required this.function,
  });
}
