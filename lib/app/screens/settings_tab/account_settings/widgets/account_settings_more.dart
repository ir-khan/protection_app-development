import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/data.dart';
import 'package:protection_app/app/core/custom/custom_listile.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';
import 'package:protection_app/app/core/device_size/device_size.dart';

Column accountSettingsMore() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextTitle("Photo Vault"),
        Gap(DeviceSize.height! * 0.025),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: Data.accountSettingsData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                customListTilePrimary(
                  Data.accountSettingsData[index].title,
                  Data.accountSettingsData[index].icon,
                  Data.accountSettingsData[index].function,
                ),
                const Gap(17),
              ],
            );
          },
        ),
      ],
    );
