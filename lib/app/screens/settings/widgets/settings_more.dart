import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:protection_app/app/core/constants/data.dart';
import 'package:protection_app/app/core/custom/custom_listile.dart';
import 'package:protection_app/app/core/custom/custom_text.dart';

Column settingsMore() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customTextTitle("More"),
        const Gap(17),
        ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: Data.settingsData.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                customListTile(
                  Data.settingsData[index].title,
                  Data.settingsData[index].icon,
                  Data.settingsData[index].function,
                ),
                const Gap(17),
              ],
            );
          },
        ),
      ],
    );
