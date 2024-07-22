import 'package:flutter/material.dart';

class ScreenBoxModel {
  final String path;
  final String title;
  final String content;
  final String buttonName;
  final bool activate;
  final void Function(BuildContext context) function;

  ScreenBoxModel({
    required this.path,
    required this.title,
    required this.content,
    required this.buttonName,
    required this.activate,
    required this.function,
  });
}
