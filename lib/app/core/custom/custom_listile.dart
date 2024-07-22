import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/device_border/device_border.dart';

///Custom Listtile with white icon
ListTile customListTile(
  String title,
  IconData icon,
  void Function() function,
) =>
    ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 25,
      ),
      horizontalTitleGap: 20,
      iconColor: AppColors.white,
      tileColor: AppColors.darkGrey,
      leading: Icon(icon),
      title: Text(title),
      textColor: TextColors.grey,
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      shape: DeviceBorder.fix.circularBorder,
      onTap: function,
    );

///Custom Listtile with primary color
ListTile customListTilePrimary(
  String title,
  IconData icon,
  void Function() function,
) =>
    ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 25,
      ),
      horizontalTitleGap: 20,
      iconColor: AppColors.primary,
      tileColor: AppColors.darkGrey,
      leading: Icon(icon),
      title: Text(title),
      textColor: TextColors.grey,
      titleTextStyle: const TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w500,
      ),
      shape: DeviceBorder.fix.circularBorder,
      onTap: function,
    );
