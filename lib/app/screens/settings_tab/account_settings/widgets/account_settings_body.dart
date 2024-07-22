import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/device_padding/device_padding.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';
import 'package:protection_app/app/screens/settings_tab/account_settings/widgets/account_settings_more.dart';

SingleChildScrollView accountSettingsBody() => SingleChildScrollView(
      child: Padding(
        padding: DevicePadding.medium.onlyHorizontal,
        child: Column(
          children: [
            Gap(DeviceSize.height! * 0.04),
            accountSettingsMore(),
          ],
        ),
      ),
    );
