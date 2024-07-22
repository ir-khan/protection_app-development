import 'package:flutter/material.dart';

class BoxModel {
  final IconData icon;
  final String title;
  final String content;
  final void Function() function;
  final String route;
  final String buttonTitle;

  BoxModel(
      {required this.icon,
      required this.title,
      required this.content,
      required this.function,
      required this.route,
      required this.buttonTitle});
}
