import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/colors.dart';
import 'package:protection_app/app/core/constants/strings.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_border/device_border.dart';
import 'package:protection_app/app/core/getit/get_it.dart';
import 'package:protection_app/app/core/navigation_helper/navigation_helper.dart';
import 'package:protection_app/app/data/repository/local/isPremium_repository.dart';
import 'package:protection_app/app/routes/routes.dart';

Column settingsSubs() =>
    getIt.get<IsPremiumRepository>().getIsPremium() ?? false
        ? Column()
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              customTextTitle("Subscription"),
              const Gap(17),
              ListView(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                children: [
                  ListTile(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    titleAlignment: ListTileTitleAlignment.top,
                    horizontalTitleGap: 10,
                    iconColor: AppColors.white,
                    tileColor: AppColors.darkGrey,
                    subtitleTextStyle: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w500,
                    ),
                    leading: Image.asset(
                      AssetsPath.diamond,
                      scale: 4.2,
                    ),
                    title: const Text("Free"),
                    subtitle: const Text(
                        "\nYou have our basic protection. Upgrade or restore your subscription to maximize your security and privacy."),
                    textColor: TextColors.grey,
                    titleTextStyle: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                    shape: DeviceBorder.fix.circularBorder,
                  ),
                  const Gap(15),
                  GestureDetector(
                    onTap: () => Navigation.pushNamed(root: Routes.paywall),
                    child: Container(
                      height: 65,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: AppColors.gradientGreen,
                        ),
                        borderRadius: DeviceBorder.fix.circularRadius,
                      ),
                      child: Center(
                        child: customTextButtonBlack("Upgrade Options"),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          );
