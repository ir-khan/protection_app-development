import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/device_border/device_border.dart';

///Custom page dot widget
Row customDot(int index, int length) => Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (position) => Row(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 85),
              width: index - 1 == position ? 25 : 15,
              height: 5,
              decoration: BoxDecoration(
                borderRadius: DeviceBorder.fix.circularRadius,
                color:
                    index - 1 == position ? AppColors.primary : AppColors.white,
              ),
            ),
            const Gap(3),
          ],
        ),
      ),
    );
