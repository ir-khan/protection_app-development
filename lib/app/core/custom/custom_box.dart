import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_border/device_border.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';

///Custom box widget for home screen
GestureDetector customBox(
  String route,
  IconData icon,
  String title,
  String content,
  String buttonTitle,
) =>
    GestureDetector(
      onTap: () {
        if (route != "") Navigation.pushNamed(root: route);
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: AppColors.darkGrey,
              borderRadius: DeviceBorder.fix.circularRadius,
            ),
            height: 233,
            width: double.infinity,
            padding: DevicePadding.medium.boxSpecial,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  icon,
                  color: AppColors.primary,
                  size: 40,
                ),
                customTextTitle(
                  title,
                ),
                customTextContent(
                  content,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    buttonTitle,
                    style: const TextStyle(
                      color: AppColors.background,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const Gap(20),
        ],
      ),
    );
