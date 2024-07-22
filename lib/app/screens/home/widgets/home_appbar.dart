import 'package:flutter/material.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_appbar.dart';
import 'package:protection_app/app/core/device_border/device_border.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/getit/get_it.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/core/theme/neon_icons.dart';
import 'package:protection_app/app/data/repository/local/isPremium_repository.dart';
import 'package:protection_app/app/routes/routes.dart';

AppBar homeAppBar() => customAppBarHome(
      IconButton(
        onPressed: () => Navigation.pushNamed(root: Routes.settings),
        icon: Padding(
          padding: DevicePadding.small.onlyLeft,
          child: const Icon(
            NeonIcons.settings,
          ),
        ),
      ),
      [
        getIt.get<IsPremiumRepository>().getIsPremium() ?? false
            ? SizedBox.shrink()
            : Padding(
                padding: DevicePadding.medium.onlyRight,
                child: GestureDetector(
                  onTap: () => Navigation.pushNamed(root: Routes.paywall),
                  // onTap: () {},
                  child: Container(
                    width: 145,
                    height: 45,
                    decoration: BoxDecoration(
                      color: AppColors.darkGrey,
                      borderRadius: DeviceBorder.fix.circularRadius,
                    ),
                    padding: DevicePadding.small.symetric,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          AssetsPath.diamond,
                          scale: 4,
                        ),
                        Text(
                          AppStrings.upgrade.toUpperCase(),
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
      ],
    );
