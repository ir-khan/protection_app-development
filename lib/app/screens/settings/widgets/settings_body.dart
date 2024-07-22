import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/screens/settings/widgets/settings_more.dart';
import 'package:protection_app/app/screens/settings/widgets/settings_subs.dart';

SingleChildScrollView settingsBody() => SingleChildScrollView(
      child: Padding(
        padding: DevicePadding.medium.onlyHorizontal,
        child: Column(
          children: [
            const Gap(15),
            settingsSubs(),
            const Gap(15),
            settingsMore(),
          ],
        ),
      ),
    );
